require 'spec_helper'

describe User do
  context "validations" do
    it "should have an email" do
      user = User.new :email => nil
      user.should_not be_valid
      user.errors[:email].should include("can't be blank")
    end

    it "should have a unique email" do
      User.create(:email=>"email@mail.com")
      user = User.new(:email=>"email@mail.com")
      user.should_not be_valid
      user.errors[:email].should include("has already been taken")
    end

    it "should have valid email" do
      user = User.new :email => 'email'
      user.should_not be_valid
      user.errors[:email].should include("is invalid")
    end
  end

  context "with secure password" do
    it "can be created" do
      user = User.new :email => "foo@bar.com", :password => "sekrit", :password_confirmation => "sekrit"
      user.save.should be_true
    end
  end

  context "authentication" do
    it "can find and authenticate a user with email and password"
  end
end