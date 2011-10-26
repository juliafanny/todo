require 'spec_helper'

describe UsersController do
	# render_views

 #  describe "GET 'show'" do

 #    before(:each) do
 #      @user = Factory(:user)
 #    end

  #   it "should be successful" do
  #     get :show, :id => @user
  #     response.should be_success
  #   end

  #   it "should find the right user" do
  #     get :show, :id => @user
  #     assigns(:user).should == @user
  #   end
  # end

	it "should have a new action" do
		get :new
    response.should render_template("users/new")
  end

	it "should have a create action" do
	post :create, :user => {:email => "foo@bar.com", :password => "soopersekrit!", :password_confirmation => "soopersekrit!"}

	end

end
