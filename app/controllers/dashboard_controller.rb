class DashboardController < ApplicationController
  #load_and_authorize_resource
  
  def index
    # /dashboard/id
    @club = current_user
  end
  
  def profile
    # /dashboard/id/profile
    @club = current_user
  end

  def boxers
    # /dashboard/id/boxers
    @boxers = current_user.get_boxers
  end

  def events
    # /dashboard/id/events
    @events = current_user.get_events
  end
  
end
