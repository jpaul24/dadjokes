class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @joke = Joke.find(params[:joke_id].to_i)
    @comment.joke = @joke
    @comment.user = current_user
    authorize @comment
    if @comment.save

    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to jokes_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :joke_id, :user_id)
  end
end
