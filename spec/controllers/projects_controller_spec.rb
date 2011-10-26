require 'spec_helper'

describe ProjectsController do
	before do
  	@project = Factory(:project)
	end

	it "should have a create action" do
	post :create, :project => {:name => "foo"}
  end

  it "should have a show action" do
    get :show, :id => @project
    assigns(:project).should == @project
  end

end
