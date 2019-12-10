class JokesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_joke, only: [:show, :edit, :update, :destroy]

  def index
    @jokes = policy_scope(Joke)
  end

  def new
    @joke = Joke.new
    authorize @joke
  end

  def show
  end

  def create
    @joke = Joke.new
    @joke.user = current_user
    authorize @joke
    if @joke.save
      redirect_to joke_path(@joke)
    else
      render :new
    end
  end

  def update
    @joke.update(joke_params)
    authorize @joke
    redirect_to joke_path(@joke)
  end

  private

  def joke_params
    params.require(:joke).permit(:joke, :user_id)
  end

  def set_joke
    @joke = Joke.find(params[:id])
    authorize @joke
  end
end
