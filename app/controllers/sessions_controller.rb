class SessionsController < ApplicationController
  #force_ssl
  
  def new
  end
  
  def create
    club = Club.find_by_contact_mail(params[:email])
    
    if club && club.authenticate(params[:password])
      session[:club_id] = club.id
      redirect_to my_profile_path, notice: I18n.t(:login_successful)
    else
      flash.now[:alert] = I18n.t(:login_failed)
      render action: 'new'
    end
  end

  def destroy
    session[:club_id] = nil
    redirect_to root_url, notice: I18n.t(:logout_successful)
  end
end
