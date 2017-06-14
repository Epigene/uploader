class LoginController < ApplicationController
  skip_before_action :require_user

  # GET new_login_path | /login/new
  def new
    redirect_to root_path if current_user
  end

  # POST login_path | /login
  def create
    if log_in_from_parameters
      redirect_to root_path, flash: {notice: "Welcome, #{current_user.email}!"}
    else
      redirect_to new_login_path, flash: {alert: "Invalid credentials!"}
    end
  end

  # DELETE login_path | /login
  def destroy
    session.delete(:user_id)
    redirect_to new_login_path, flash: {notice: "Logged out. Bye!"}
  end

  private
    def log_in_from_parameters
      if params[:email].present? && params[:password].present?
        if user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
          session[:user_id] = user.id
          true
        else
          false
        end
      else
        false
      end
    end

end
