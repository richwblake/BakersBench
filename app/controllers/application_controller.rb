class ApplicationController < ActionController::Base
    def logged_in? 
        redirect_to new_session_path, alert: "You must log in to your BB Account to access this page" unless !!session[:user_id]
    end
end
