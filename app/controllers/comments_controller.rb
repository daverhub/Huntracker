class CommentsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    @comments = @job.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.job_id = params[:job_id]
    if @comment.save
      flash[:notice] = 'Comment added'
    else
      flash[:notice] = 'Comment not saved'
    end
    redirect_to :back
  end

  protected

  def comment_params
    params.require(:comment).permit(:body)
  end
end
