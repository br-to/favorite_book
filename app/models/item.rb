class Item < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  has_one_attached :item_image
  attr_accessor :image

  def parse_base64
    if image.present?
      content = image.split(',')[1]
      filename = Time.zone.now.to_s + '.png'
      decoded_data = Base64.decode64(content)
      item_image.attach(io: StringIO.new(decoded_data), filename: filename)
    end
  end
end