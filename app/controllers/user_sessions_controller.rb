class UserSessionsController < ApplicationController

    def new
    end

    def create
        if login(params[:email], params[:name])
          @user = User.find(session[:current_user_id])
          flash.now.alert = @user.email
          redirect_to user_path(@user)
        else
            flash.now.alert = "Login failed. Please try again."
            render 'new'
        end
    end

    def destroy
        logout
        redirect_to root_path
    end

    private

    def login(email, name)
      user = User.find_by(email: params[:email])
      if user == nil || user.name != name
        return false
      else
        session[:current_user_id] = user.id
      end
    end

    def logout
      session[:current_user_id] = nil
      reset_session
    end
end
