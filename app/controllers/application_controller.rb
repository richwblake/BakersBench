class ApplicationController < ActionController::Base
    def logged_in? 
        redirect_to new_session_path, alert: "You must log in to your BB Account to access this page" unless !!session[:user_id]
    end

    def current_user
        @user = User.find_by(id: session[:user_id]) if !!session[:user_id]
    end

    def alert_and_redirect_due_to_bad_permissions(user)
        redirect_to user_path(user), alert: "You cannot modify this user's information, as you are not that user!"
    end
end
