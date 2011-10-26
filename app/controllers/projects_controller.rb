class ProjectsController < ApplicationController

	def new
    @project = Project.new()
  end

	def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'User was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

	def show
    @project = Project.find(params[:id])
    @task = Task.new( :project => @project )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end
end
