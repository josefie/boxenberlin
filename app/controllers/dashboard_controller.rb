class DashboardController < ApplicationController
  #load_and_authorize_resource
  
  def profile
    # /dashboard/id/profile
    @club = current_user
    authorize! :show, @club
  end

  def boxers
    # /dashboard/id/boxers
    @club = current_user
    authorize! :show, @club
    @boxers = current_user.get_boxers
  end

  def events
    # /dashboard/id/events
    @club = current_user
    authorize! :show, @club
    @events = current_user.get_events
  end
  
end
