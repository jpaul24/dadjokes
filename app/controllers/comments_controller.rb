class CommentsController < ApplicationController
  def new
    @comment = Review.new
    authorize @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:joke_id, :user_id)
  end
end
