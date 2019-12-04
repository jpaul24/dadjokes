class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def comments
    @comments = current_user.comments
    authorize @comments
  end

  def favourites
    @favourites = current_user.favourites
    authorize @favourites
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
