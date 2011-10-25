require 'spec_helper'

describe Project do
	context "validations" do
		it "should have a name" do
			project = Project.new :name => nil
			project.should_not be_valid
			project.errors[:name].should include("can't be blank")
		end
	end
end
