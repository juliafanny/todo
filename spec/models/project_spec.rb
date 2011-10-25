require 'spec_helper'

describe Project do
	context "validations" do
		it "should have a name" do
			project = Project.new :name => nil
			project.should_not be_valid
			project.errors[:name].should include("can't be blank")
		end

		it "should have a name with max 30 letters" do
		 project = Project.new(:name => ("a"*31))
		 project.should_not be_valid
		 project.errors[:name].should include("is too long (maximum is 30 characters)")
		end
	end

end
