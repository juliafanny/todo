class ProjectMembership < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	# scope :pending_joins, { |project_id|
	# 	where(:accepted => "false", :project_id => project_id). 
	#  	order("created_at DESC")
	# }
	scope :pending_joins, lambda {
		where(:accepted => false). 
	 	order("created_at DESC")
	}
end
