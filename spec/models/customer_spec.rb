require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:birthday) }
  it { is_expected.to validate_presence_of(:country) }

  let(:valid_attributes) { FactoryBot.attributes_for(:customer) }
  it "Birthday must be an earlier date" do
    customer = Customer.create! valid_attributes
    expect(customer.birthday).to be < Time.now
  end
end
