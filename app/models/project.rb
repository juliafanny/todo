class Project < ActiveRecord::Base
	validates :name, :presence => true, :length => { :maximum => 30 }

	has_one :project_membership
	has_many :users, :through => :project_memberships
end
