FactoryBot.define do
  factory :customer do
    first_name { "MyString" }
    last_name { "MyString" }
    birthday { "2022-04-23" }
    country { "MyString" }
  end
end
