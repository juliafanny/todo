require 'spec_helper'

describe Comment do
  context "accossiation" do
  	it "should belong to task" do
	  	comment = Comment.new
	  	comment.should respond_to(:task)
	  end
  end
end
