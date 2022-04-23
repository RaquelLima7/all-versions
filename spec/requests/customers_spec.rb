require 'rails_helper'

RSpec.describe "/customers", type: :request do
  
  let(:valid_attributes) { FactoryBot.attributes_for(:customer) }
  let(:new_attributes) { FactoryBot.attributes_for(:customer) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:customer, first_name: nil) }
 
  describe "GET /index" do
    it "renders a successful response" do
      Customer.create! valid_attributes
      get customers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      customer = Customer.create! valid_attributes
      get customer_url(customer)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_customer_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      customer = Customer.create! valid_attributes
      get edit_customer_url(customer)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Customer" do
        expect {
          post customers_url, params: { customer: valid_attributes }
        }.to change(Customer, :count).by(1)
      end

      it "redirects to the created customer" do
        post customers_url, params: { customer: valid_attributes }
        expect(response).to redirect_to(customer_url(Customer.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Customer" do
        expect {
          post customers_url, params: { customer: invalid_attributes }
        }.to change(Customer, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post customers_url, params: { customer: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer), params: { customer: new_attributes }
        customer.reload
      end

      it "redirects to the customer" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer), params: { customer: new_attributes }
        customer.reload
        expect(response).to redirect_to(customer_url(customer))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        customer = Customer.create! valid_attributes
        patch customer_url(customer), params: { customer: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested customer" do
      customer = Customer.create! valid_attributes
      expect {
        delete customer_url(customer)
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      customer = Customer.create! valid_attributes
      delete customer_url(customer)
      expect(response).to redirect_to(customers_url)
    end
  end

  describe "GET /customers/:id/versions" do
    it "should get versions" do
      customer = Customer.create! valid_attributes
      get versions_customer_path(customer)
      expect(response).to be_successful
    end
  end

  # describe "GET /customers/:id/versions/:id" do
  #   it "should get version" do
  #     customer = Customer.create! valid_attributes
  #     patch customer_url(customer), params: { customer: new_attributes }
  #     get version_customer_path(customer, customer.versions.last)
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /customers/:id/versions/:id" do
  #   it "should revert version" do
  #     with_versioning do
  #       customer = Customer.create! valid_attributes
  #       patch customer_url(customer), params: { customer: new_attributes }
  #       post revert_customer_path(customer, customer.versions.last)
  #     end
  #   end
  # end

  # describe "GET /customers/deleted" do
  #   it "should get deleted" do
  #     Customer.destroy_all
  #     get deleted_customers_path
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /customers/:id/restore" do
  #   it "should restore customer" do
  #     customer = Customer.create! valid_attributes
  #     delete customer_url(customer)
  #     assert_difference("Customer.count") do
  #       post restore_customer_path(customer)
  #     end
  #   end
  # end
end
