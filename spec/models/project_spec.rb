require 'spec_helper'

describe Project do
	before do
  	@project = Factory(:project)
	end
	
	context "validations" do
		it "should have a name" do
			@project.name = nil
			@project.should_not be_valid
			@project.errors[:name].should include("can't be blank")
		end

		it "should have a name with max 30 letters" do
		 @project.name = ("a"*31)
		 @project.should_not be_valid
		 @project.errors[:name].should include("is too long (maximum is 30 characters)")
		end
	end

end
