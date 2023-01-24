class CommentsController < ApplicationController
  def comment_params
    params.require(:comment).permit(:issue_id, :description)
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end
end
