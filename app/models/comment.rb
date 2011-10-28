class Comment < ActiveRecord::Base
	belongs_to :task
	belongs_to :user

	validates :body, :presence => true, :length => { :maximum => 200 }

	# scope :new_comments, lambda { 
	#  	order("created_at DESC").
	# 	limit(10)
	# }
end
