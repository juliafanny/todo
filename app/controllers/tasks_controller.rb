class TasksController < ApplicationController
  def new
    @task = Task.new()
  end

	def create #post = project comment = task
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(params[:task].merge(:user_id => session[:user_id]))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'tack för kommentaren.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
 
    redirect_to(@task.project)
  end
end
