class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.save
      flash.alert = 'Sign up successful. Please log in.'
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to login_path unless @user == current_user
  end

  def current_user
    current_user = User.find(session[:current_user_id])
  end

end
