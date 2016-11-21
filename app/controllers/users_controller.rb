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
    @past_events = current_user.events.previous_events.order(date: :asc)
    @future_events = current_user.events.future_events.order(date: :asc)
    @invites = Invite.where(attendee: current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
