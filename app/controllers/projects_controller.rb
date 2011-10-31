class ProjectsController < ApplicationController

  def index
    @search = Project.search do
      fulltext params[:search]
    end
    @projects = @search.results
   #@projects = Project.all

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
    #@news = {
    #           :new_comments => @project.tasks.map(&:comments).map(&:new_comments),
    #           :newly_completed_tasks => @project.tasks.map(&:newly_completed),
    #            :newly_added_tasks => @project.tasks.map(&:newly_added)
    #         }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end
end
