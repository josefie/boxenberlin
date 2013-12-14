class ParticipationsController < ApplicationController
  
  def destroy
    @participation = Participation.find(params[:id])
    event = Event.find(@participation.event_id)
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to event }
      format.json { head :no_content }
    end
  end
  
end
