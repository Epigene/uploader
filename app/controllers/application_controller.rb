class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_user

  private
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = User.find_by(id: session[:user_id])
    end

    def require_user
      redirect_to new_login_path, flash: {alert: "Please log in first!"} unless current_user
    end
end
