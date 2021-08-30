class ItemTag
  include ActiveModel::Model
  attr_accessor :images, :item_name, :explanation, :category_id, :status_id, :burden_method_id,
                :shipment_source_id, :shipping_days_id, :price, :user_id,
                :tag_name

  with_options presence: true do
    validates :images
    validates :item_name
    validates :explanation
    validates :tag_name
    validates :user_id
  end
  with_options presence: true, numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :status_id
    validates :burden_method_id
    validates :shipment_source_id
    validates :shipping_days_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  def save
      item = Item.create(images: images, item_name: item_name, explanation: explanation,
                         category_id: category_id, status_id: status_id, burden_method_id: burden_method_id,
                         shipment_source_id: shipment_source_id, shipping_days_id: shipping_days_id,
                         price: price, user_id: user_id)
      tag = Tag.create(tag_name: tag_name)
      ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end