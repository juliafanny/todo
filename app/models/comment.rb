class Comment < ActiveRecord::Base
	belongs_to :task
	belongs_to :user

	validates :body, :length => { :maximum => 200 } #:presence => true, 
end
