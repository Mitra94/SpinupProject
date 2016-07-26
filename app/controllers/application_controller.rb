class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :success, :warning, :danger, :info
  protect_from_forgery with: :exception
  include SessionsHelper

    before_filter :require_login

    private

    def require_login
        if !logged_in? && !logged_in_dev?
          redirect_to login_url
        end
    end

    private

    def require_admin
      if logged_in_dev? 
        redirect_to developer_path(current_dev)
      elsif !current_user.admin?
        redirect_to user_path(current_user)
    end
  end

end
