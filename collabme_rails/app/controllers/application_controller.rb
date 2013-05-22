class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def require_login
    unless session[:current_user_id]
      flash[:error] = 'You must be logged in to access this section.'
      redirect_to login_researchers_path
    end
  end
end
