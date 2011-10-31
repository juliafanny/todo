class Project < ActiveRecord::Base
	validates :name, :presence => true, :length => { :maximum => 30 }

	has_many :project_memberships
	has_many :users, :through => :project_memberships
	has_many :tasks, :dependent => :destroy

	before_create :accept_all_project_memberships

	def has_user?(user)
		@project_membership = project_memberships.where(:user_id => user.id, :accepted => true)
		return @project_membership.any? 
		
	end

	def false_user?(user)
		@project_membership = project_memberships.where(:user_id => user.id, :accepted => false)
		return @project_membership.any? 
		
	end

	searchable do
		text :name
	end

	def accept_all_project_memberships
		project_memberships.map {|pm| pm.accepted = true; }
	end
end
