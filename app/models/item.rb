class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_many :comments
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  
  has_many_attached :images
  belongs_to :category
  belongs_to :status
  belongs_to :burden_method
  belongs_to :shipment_source
  belongs_to :shipping_days

=begin
  タグ付け機能実装によるフォームオブジェクトパターン使用前
  with_options presence: true do
    validates :images
    validates :item_name
    validates :explanation
  end
  with_options presence: true, numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :status_id
    validates :burden_method_id
    validates :shipment_source_id
    validates :shipping_days_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
=end
end