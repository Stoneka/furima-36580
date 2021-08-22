class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipment_source_id, :city, :block, :building, :phone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_source_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone, format: {with: /\d{10,11}/}
    validates :building, allow_blank: true
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, shipment_source_id: shipment_source_id,
       city: city, block: block, building: building, phone: phone, order_id: order.id)
  end
end