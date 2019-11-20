class JokesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @jokes = Joke.all
  end

  def new
    @joke = Garden.new
    authorize @joke
  end

  def show
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
  end

  def edit
  end

  def destroy
  end

  private

  def set_joke
    @joke = Joke.find(params[:id])
  end

  def joke_params
    params.require(:joke).permit(:joke)
  end
end
