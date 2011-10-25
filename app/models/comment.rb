class Comment < ActiveRecord::Base
	belongs_to :task

	validates :body, :length => { :maximum => 200 } #:presence => true, 
end
