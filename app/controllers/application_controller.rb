class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  def current_user
    @current_user ||= Club.find(session[:club_id]) if session[:club_id]
  end
  
  def admin?
    false
  end
  
  def authorize    
    unless current_user
      flash[:notice] = "Please log in to see this page."
      redirect_to new_session_path
      false
    else
      unless admin?
        flash[:notice] = "You are not authorized to see this page."
        false
      else
        flash[:notice] = "True."
        true
      end
    end
  end
  
  helper_method :current_user, :admin?

end
