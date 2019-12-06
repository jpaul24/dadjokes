class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create

  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :joke_id, :user_id)
  end
end
