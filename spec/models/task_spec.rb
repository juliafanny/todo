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

  context "scopes" do
    context "newly_created" do
      it "should find a couple of new tasks" do
        new_task = Factory(:task, :created_at => Time.now)
        newish_task = Factory(:task, :created_at => 3.days.ago)
        tasks = Task.newly_added
        tasks.should include new_task
        tasks.should include newish_task
      end

      it "should not find an old task" do
        old_task = Factory(:task, :created_at => 3.weeks.ago)
        Task.newly_added.should_not include old_task
      end
      it "should at most find 10 tasks"
      it "should order them by created_at"
    end

    context "newly_completed" do
      it "should find a couple of newly completed tasks"
      it "should not find uncompleted tasks"
      it "should not find an old completed task"
      it "should find at most 10 tasks"
      it "should order them by completed_at"
    end
  end

end
