class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden_method
  belongs_to :shipment_source
  belongs_to :shipping_days

  validates :item_name, presence: true
  validates :explanation, presence: true
  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :burden_method
    validates :shipment_source
    validates :shipping_days
  end
  validates :price, numericality: [{greater_than_or_equal_to: 300}, {less_than_or_equal_to: 9,999,999}]
end
