class Order < ApplicationRecord

belongs_to :user
belongs_to :item
has_one :shipping

belongs_to :burden_method, shortcuts: [:name]
belongs_to :shipment_source, shortcuts: [:name]

end
