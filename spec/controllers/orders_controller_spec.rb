require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  # This should return the minimal set of attributes required to create a valid
  # Inquire. As you add validations to Inquire, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { username: "Name", phone: '891234567890' } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InquiresController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "POST create" do
    before(:each) do
      request.env["HTTP_REFERER"] = "/"
    end
    describe "with valid params" do
      it "creates a new Inquire" do
        expect {
          post :create, format: :json, order: valid_attributes
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created inquire as @inquire" do
        post :create, format: :json, order: valid_attributes
        assigns(:order).should be_a(Order)
        assigns(:order).should be_persisted
      end
    end
  end
end
