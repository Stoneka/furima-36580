FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {手酢}
    first_name            {都}
    last_name_kana        {テス}
    first_name_kana       {ト}
    birth_year            {Faker::Number.between(from: 1930, to: 2016)}
    birth_month           {Faker::Number.between(from: 1, to: 12)}
    birth_day             {Faker::Number.between(from: 1, to: 28)}
    birthday              {birth_year-birth_month-birth_day}
  end
end