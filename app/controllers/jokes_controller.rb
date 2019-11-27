class JokesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_joke, only: [:show, :edit, :update, :destroy]

  def index
    @jokes = policy_scope(Joke)
  end

  def show
  end

  def new
  end

  private

  def set_joke
    @joke = Joke.find(params[:id])
    authorize @joke
  end
end
