class ProjectMembership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  before_create :set_accepted_if_first_membership

  scope :pending_joins, where(:accepted => false).order("created_at DESC")

  scope :accepted, where(:accepted => true)
  
  def set_accepted_if_first_membership
    self.accepted = true if project.project_memberships.empty?
  end
end
