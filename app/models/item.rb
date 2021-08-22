class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  
  has_one_attached :image
  belongs_to :category, shortcuts: [:name]
  belongs_to :status, shortcuts: [:name]
  belongs_to :burden_method, shortcuts: [:name]
  belongs_to :shipment_source, shortcuts: [:name]
  belongs_to :shipping_days, shortcuts: [:name]

  with_options presence: true do
    validates :image
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
