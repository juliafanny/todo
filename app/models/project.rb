class Project < ActiveRecord::Base
	validates :name, :presence => true, :length => { :maximum => 30 }

	has_many :project_memberships
	has_many :users, :through => :project_memberships
	has_many :tasks

	#scope :recent, lambda { published.where("projectss.published_at > ?",1.week.ago.to_date)}

end
