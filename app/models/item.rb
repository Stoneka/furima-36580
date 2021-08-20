class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden_method
  belongs_to :shipment_source
  belongs_to :shipping_days

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :burden_method_id
    validates :shipment_source_id
    validates :shipping_days_id
  end
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  def was_attached?
    self.image.attached?
  end
end