require 'spec_helper'

describe Project do
  before do
    @project = Factory(:project)
  end
  
  context "validations" do
    it "should have a name" do
      project = Factory.build(:project, :name => nil)
      project.should_not be_valid
      project.errors[:name].should include("can't be blank")
    end

    it "should have a name with max 30 letters" do
      project = Factory.build(:project, :name => ("a"*31))
      project.should_not be_valid
      project.errors[:name].should include("is too long (maximum is 30 characters)")
    end
  end

  context "creation" do
    context "through a user" do
      before do
        @project = Factory(:project)
        @project.users << Factory(:user)
        @project.users << Factory(:user)
      end
      it "should set up a project membership between user and project" do
        @project.project_memberships.should_not be_empty
      end
      it "should have accpted true" do
        @project.project_memberships.select{|pm|pm.accepted?}.count.should == 1
      end
    end
  end

  context "user association" do
    before do
      @project = Factory(:project)
      @project.users << Factory(:user)
      @project.users << Factory(:user)
    end

    it "should have 2 users" do
      @project.users.length.should == 2
    end
  end

end
