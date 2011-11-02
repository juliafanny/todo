class Task < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	belongs_to :project
	belongs_to :user

	validates :name, :presence => true

	scope :newly_added_tasks, order("created_at DESC").limit(5)

	#scope :newly_added_comments, task.comment.order("created_at DESC").limit(5)
end
