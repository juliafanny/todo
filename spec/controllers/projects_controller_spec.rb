require 'spec_helper'

describe ProjectsController do
  before do
    @current_user = Factory(:user)
    @project = Factory(:project)
  end

  it "should have a create action" do
    controller.stub!(:current_user).and_return(@current_user)
    post :create, :project => {:name => "foo"}
    Project.last.users.should include @current_user
  end

  it "should have a show action" do
    get :show, :id => @project
    assigns(:project).should == @project
  end

end
