class Project < ActiveRecord::Base
	validates :name, :presence => true, :length => { :maximum => 30 }

	has_many :project_memberships
	has_many :users, :through => :project_memberships
	has_many :tasks

	def has_user?(user)
		@project_membership = project_memberships.where(:user_id => user.id, :accepted => true)
		return !@project_membership.empty?
		#users.include? user
	end

	#scope :recent, lambda { published.where("projectss.published_at > ?",1.week.ago.to_date)}

	searchable do
		text :name
	end
end
