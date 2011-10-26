class AddProjectIdAndUserIdToProjectMemberships < ActiveRecord::Migration
  def change
    add_column :project_memberships, :project_id, :integer
    add_column :project_memberships, :user_id, :integer
  end
end
