class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  def current_user
    #session[:club_id] = nil
    @current_user ||= Club.find(session[:club_id]) if session[:club_id]
  end
  
  helper_method :current_user

end
