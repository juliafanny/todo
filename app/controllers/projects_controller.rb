class ProjectsController < ApplicationController

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

	def new
    @project = Project.new()
  end

	def create
    

    respond_to do |format|
      if @project = current_user.projects.create(params[:project])
        format.html { redirect_to @project, notice: 'project was successfully created.' }
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
