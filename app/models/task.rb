class Task < ActiveRecord::Base
	has_many :comments
	belongs_to :project
	belongs_to :user

	validates :name, :presence => true

	scope :newly_added, lambda { 
		where("created_at >= ?", 1.week.ago)
	# 	order("created_at DESC").
	# 	limit(10)
	}


end
