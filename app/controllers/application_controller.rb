class ApplicationController < ActionController::Base

    helper_method :current_user, :require_login


    private
  def logged_in?
    !!session[:user_id]
  end

  def require_login
    if !logged_in?
      flash[:notice] = "Please login or signup to view more content."
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
