module ApplicationHelper
    def current_user 
        @current_user ||= Employee.find(session[:user_id]) if session[:user_id]
    end

    def is_logged_in? 
        !!current_user
    end

    def flash_alert
        if flash[:alert]
            flash[:alert]
        end
    end

    def flash_notice
        if flash[:notice]
            flash[:notice]
        end
    end
end
