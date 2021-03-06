require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FaresController do

  before do
    @user = create :plain_user
    sign_in @user
  end

  describe "GET index" do
    before do
      @low_fare_statistic = create(:low_fare)
      create :favorite_city
      LowFareSortQuery.should_receive(:new).and_return([@low_fare_statistic])
    end

    it "assigns all fares as @fares" do
      get :index, {}
      assigns(:low_fares).should eq([@low_fare_statistic])
    end
  end

  # describe "GET show" do
  #   it "assigns the requested fare as @fare" do
  #     fare = create :fare
  #     get :show, {:id => fare.to_param}
  #     assigns(:fare).should eq(fare)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new fare as @fare" do
  #     get :new, {}
  #     assigns(:fare).should be_a_new(Fare)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested fare as @fare" do
  #     fare = create :fare
  #     get :edit, {:id => fare.to_param}
  #     assigns(:fare).should eq(fare)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Fare" do
  #       expect {
  #         post :create, {:fare => (attributes_for :fare)}
  #       }.to change(Fare, :count).by(1)
  #     end

  #     it "assigns a newly created fare as @fare" do
  #       fare = create :fare
  #       assigns(:fare).should be_a(Fare)
  #       assigns(:fare).should be_persisted
  #     end

  #     it "redirects to the created fare" do
  #       post :create, {:fare => (attributes_for :fare)}
  #       response.should redirect_to(Fare.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved fare as @fare" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Fare.any_instance.stub(:save).and_return(false)
  #       post :create, {:fare => { "price" => "invalid value" }}
  #       assigns(:fare).should be_a_new(Fare)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Fare.any_instance.stub(:save).and_return(false)
  #       post :create, {:fare => { "price" => "invalid value" }}
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested fare" do
  #       fare = create :fare
  #       # Assuming there are no other fares in the database, this
  #       # specifies that the Fare created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Fare.any_instance.should_receive(:update_attributes).with({ "price" => "9.99" })
  #       put :update, {:id => fare.to_param, :fare => { "price" => "9.99" }}
  #     end

  #     it "assigns the requested fare as @fare" do
  #       fare = create :fare
  #       put :update, {:id => fare.to_param, :fare => (attributes_for :fare)}
  #       assigns(:fare).should eq(fare)
  #     end

  #     it "redirects to the fare" do
  #       fare = create :fare
  #       put :update, {:id => fare.to_param, :fare => (attributes_for :fore)}
  #       response.should redirect_to(fare)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the fare as @fare" do
  #       fare = create :fare
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Fare.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => fare.to_param, :fare => { "price" => "invalid value" }}
  #       assigns(:fare).should eq(fare)
  #     end

  #     it "re-renders the 'edit' template" do
  #       fare = create :fare
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Fare.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => fare.to_param, :fare => { "price" => "invalid value" }}
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested fare" do
  #     fare = create :fare
  #     expect {
  #       delete :destroy, {:id => fare.to_param}
  #     }.to change(Fare, :count).by(-1)
  #   end

  #   it "redirects to the fares list" do
  #     fare = create :fare
  #     delete :destroy, {:id => fare.to_param}
  #     response.should redirect_to(fares_url)
  #   end
  # end

end
