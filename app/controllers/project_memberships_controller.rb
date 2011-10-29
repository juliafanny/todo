class ProjectMembershipsController < ApplicationController

	def new
		@projectMembership = ProjectMembership.new
	end

  def create
  	@project = Project.find(params[:id])

  	@projectMembership = ProjectMembership.new
  	@projectMembership.project_id = @project.id
  	@projectMembership.user_id = current_user.id
  	@projectMembership.accepted = false

  	respond_to do |format|
      if @projectMembership.save
	  		format.html { redirect_to project_path(@project), notice: 'project joined.' }
	  	else 
	  		format.html { redirect_to project_path(@project), notice: 'join failed.' }
	  	end
    end
  end

  def accept_join
  	@projectMembership = ProjectMembership.find(params[:id])
  	@projectMembership.accepted = true

  	@project = Project.find(@projectMembership.project_id)

  	respond_to do |format|
      if @projectMembership.save
	  		format.html { redirect_to project_path(@project), notice: 'join accepted.' }
	  	else 
	  		format.html { redirect_to project_path(@project), notice: 'fail.' }
	  	end
    end
  end

end
