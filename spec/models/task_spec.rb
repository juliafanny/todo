require 'spec_helper'

describe Task do
  # before do
  #   @task = Factory(:task)
  # end

  context "validations" do
    it "should have a name" do
      task = Factory.build(:task, :name => nil)
      task.should_not be_valid
      task.errors[:name].should include("can't be blank")
    end
  end
end
