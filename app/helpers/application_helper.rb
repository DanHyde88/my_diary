module ApplicationHelper

    def logged_in?
        return true if session[:current_user_id] != nil
    end

    def current_user
    current_user = User.find(session[:current_user_id])
  end
  
end
