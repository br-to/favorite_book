class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality:{ greater_than_or_equal_to: 0 }
  has_one_attached :item_image
  attr_accessor :image

  def parse_base64
    if image.present?
      prefix = image[/(image|application)(\/.*)(?=;)/]
      type = prefix.sub(/(image|application)(\/)/, '')
      decoded_data = Base64.decode64(image.sub(/data:#{prefix};base64,/, ''))
      filename = "#{Time.zone.now.to_s}.#{type}"
      item_image.attach(io: StringIO.new(decoded_data), filename: filename)
    end
  end

  def item_image_url
    url_for(item_image) if item_image.attached?
  end
end