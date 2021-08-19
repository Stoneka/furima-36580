class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden_method
  belongs_to :shipment_source
  belongs_to :shipping_days
end
