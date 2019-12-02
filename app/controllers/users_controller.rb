class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
