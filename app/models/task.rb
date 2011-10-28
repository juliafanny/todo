class Task < ActiveRecord::Base
	has_many :comments
	belongs_to :project
	belongs_to :user

	validates :name, :presence => true

	scope :newly_added_tasks, lambda { 
	 	order("created_at DESC").
		limit(5)
	}


end
