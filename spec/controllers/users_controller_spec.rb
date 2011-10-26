require 'spec_helper'

describe UsersController do

	it "should have a new action" do
		get :new
    response.should render_template("users/new")
  end

	it "should have a create action" do
	post :create, :user => {:email => "foo@bar.com", :password => "soopersekrit!", :password_confirmation => "soopersekrit!"}

	end

end
