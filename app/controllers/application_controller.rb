class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper
    # helper_method :current_user, :logged_in?
    TODAYS_CODE = 'num'

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) #memoization
    end 

    def logged_in?
        current_user.present?
    end
    
    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to login_path
        end
    end
end  
