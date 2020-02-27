class HomeController < ApplicationController
  def index
    render json: @decode_token
  end
end
