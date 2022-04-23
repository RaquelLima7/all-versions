FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 80) }
    country { Faker::Address.country }
  end
end

