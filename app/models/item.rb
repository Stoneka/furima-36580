class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  
  has_many_attached :images
  belongs_to :category
  belongs_to :status
  belongs_to :burden_method
  belongs_to :shipment_source
  belongs_to :shipping_days

  with_options presence: true do
    validates :images
    validates :item_name
    validates :explanation
  end
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :burden_method_id
    validates :shipment_source_id
    validates :shipping_days_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
