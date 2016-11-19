class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    current_user = User.find(session[:current_user_id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to login_path unless @user == current_user
  end
end
