class CommentsController < ApplicationController

  def create
    task = Task.find params[:task_id]
    comment = task.comments.new params[:comment]
    if comment.save
      redirect_to project_path(comment.task.project), :notice => "Comment saved"
    else
      redirect_to project_path(comment.task.project), :notice => "Comment could not be saved"
    end
  end

end
