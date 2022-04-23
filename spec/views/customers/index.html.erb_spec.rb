require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        first_name: "First Name",
        last_name: "Last Name",
        country: "Country",
        birthday: "Sat, 22 Apr 2017"
      ),
      Customer.create!(
        first_name: "First Name",
        last_name: "Last Name",
        country: "Country",
        birthday: "Sat, 22 Apr 2017"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Country".to_s, count: 2
  end
end
