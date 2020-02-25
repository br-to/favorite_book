class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    if request.headers['Authorization'].present?
      begin
      encode_token = request.headers['Authorization'].split('Bearer ').last
      @decode_token = JWT.decode(encode_token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')[0] 
      rescue JWT::DecodeError, JWT::VerificationError
        render json: { errors: ['Missing credentials'] }, status: :unauthorized
      end
    else
      render json: { errors: ['Missing token'] }, status: :unauthorized 
    end
  end
end
