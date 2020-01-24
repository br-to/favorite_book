class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :image
  def image
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
