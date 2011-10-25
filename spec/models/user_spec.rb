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

		#password
		#has_project_membership
		#can create projects (hör väl till projects?)
		#can be deleted (hör till user_controllern?)
		#varning vid delete


	end
end