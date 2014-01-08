class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!
  protect_from_forgery with: :exception

   protected
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please login!"
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end
end
