@customer = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, country: Faker::Address.country, birthday: Faker::Date.birthday(min_age: 18, max_age: 80))
2.upto(6) do |i|
  @customer = Customer.update(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, country: Faker::Address.country, birthday: Faker::Date.birthday(min_age: 18, max_age: 80))
end

1.upto(2) do |i|
  @deleted_customer = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, country: Faker::Address.country, birthday: Faker::Date.birthday(min_age: 18, max_age: 80))
  @deleted_customer.destroy
  @deleted_customer= Customer.new(id: @deleted_customer.id).versions.last.reify
  @deleted_customer.save
  @deleted_customer.update(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, country: Faker::Address.country, birthday: Faker::Date.birthday(min_age: 18, max_age: 80))
  @deleted_customer.destroy
end

@restored_customer = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, country: Faker::Address.country, birthday: Faker::Date.birthday(min_age: 18, max_age: 80))
@restored_customer.destroy
@restored_customer = Customer.new(id: @restored_customer.id).versions.last.reify
@restored_customer.save
