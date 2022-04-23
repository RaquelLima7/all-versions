require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthday: Faker::Date.birthday(min_age: 18, max_age: 80),
      country: Faker::Address.country
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input[name=?]", "customer[first_name]"

      assert_select "input[name=?]", "customer[last_name]"

      assert_select "input[name=?]", "customer[country]"
    end
  end
end
