class TasksController < ApplicationController
  before_filter :require_user, :except => [:index, :show, :create]

  def new
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.build(params[:task])
  end

	def create
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.build(params[:task])
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: 'do it.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
 
    redirect_to(@task.project)
  end
end
