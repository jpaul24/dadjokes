class JokesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_joke, only: [:show, :edit, :update, :destroy]

  def index
    @jokes = policy_scope(Joke).order(created_at: :desc)
    # @jokes = Joke.all
  end

  def new
    @joke = Joke.new
    authorize @joke
  end

  def show
    @joke = Joke.find(params[:id])
    authorize @joke
  end

  def create
    @joke = Joke.new(joke_params)
    @joke.user = current_user
    authorize @joke
    if @joke.save
      redirect_to joke_path(@joke)
    else
      render :new
    end
  end

  def update
    authorize @joke
    @joke.update(joke_params)
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
