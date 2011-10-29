class CommentsController < ApplicationController
  before_filter :require_user, :except => [:index, :show, :create]

  def create
    task = Task.find(params[:task_id])
    comment = task.comments.build(params[:comment])
    comment.user_id = current_user.id

    if comment.save
      redirect_to project_path(comment.task.project), :notice => "Comment added."
    else
      redirect_to project_path(comment.task.project), :notice => "Comment could not be saved"
    end
  end

end
