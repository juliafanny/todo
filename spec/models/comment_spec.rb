require 'spec_helper'

describe Comment do
  context "accossiation" do
  	it "should belong to task" do
	  	comment = Comment.new
	  	comment.should respond_to(:task)
	  end

	  it "should belong to task" do
	  	comment = Comment.new
	  	comment.should respond_to(:user)
	  end
	end

	 context "validation" do
	  it "should have a body with max 200 letters" do
		 comment = Comment.new(:body => ("a"*201))
		 comment.should_not be_valid
		 comment.errors[:body].should include("is too long (maximum is 200 characters)")
		end
	end
end
