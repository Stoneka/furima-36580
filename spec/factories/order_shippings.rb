FactoryBot.define do
  factory :order_shipping do
    postal_code         {"123-4567"}
    shipment_source_id  {Faker::Number.between(from: 2, to: 48) }
    city                {Faker::Address.city}
    block               {Faker::Address.city}
    phone               {Faker::Number.number(digits: 10)}
    building            {Faker::Address.street_address}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
