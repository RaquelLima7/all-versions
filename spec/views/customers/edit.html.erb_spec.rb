require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthday: Faker::Date.birthday(min_age: 18, max_age: 80),
      country: Faker::Address.country
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[first_name]"

      assert_select "input[name=?]", "customer[last_name]"

      assert_select "input[name=?]", "customer[country]"
    end
  end
end

