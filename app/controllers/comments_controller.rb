class CommentsController < ApplicationController

  private

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :garden_id)
  end
end
