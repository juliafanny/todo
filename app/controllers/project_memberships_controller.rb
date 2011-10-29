class ProjectMembershipsController < ApplicationController

	def new
		@projectMembership = ProjectMembership.new
	end

  def create
  	@project = Project.find(params[:id])

  	@projectMembership = ProjectMembership.new
  	@projectMembership.project_id = @project.id
  	@projectMembership.user_id = current_user.id

  	respond_to do |format|
      if @projectMembership.save
	  		format.html { redirect_to project_path(@project), notice: 'project joined.' }
	  	else 
	  		format.html { redirect_to project_path(@project), notice: 'join failed.' }
	  	end
    end
  end

end
