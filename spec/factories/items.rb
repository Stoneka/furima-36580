FactoryBot.define do
  factory :item do
    item_name          { Faker::Name.initials(number: 2) }
    explanation        { Faker::Types.rb_string }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    status_id          { Faker::Number.between(from: 2, to: 7) }
    burden_method_id   { Faker::Number.between(from: 2, to: 3) }
    shipment_source_id { Faker::Number.between(from: 2, to: 48) }
    shipping_days_id   { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |sample|
      sample.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
