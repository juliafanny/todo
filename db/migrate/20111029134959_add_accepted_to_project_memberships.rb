class AddAcceptedToProjectMemberships < ActiveRecord::Migration
  def change
  	add_column :project_memberships, :accepted, :boolean
  end
end
