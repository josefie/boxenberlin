class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :apply, :send_application, :participations]
  #load_and_authorize_resource
  
  Inf = 1.0 / 0.0
  
  # GET /events
  # GET /events.json
  def index
    events_approved = Event.where(:approved => true)
    
    if params[:date]
      @current_date = Date.parse(params[:date])
    else
      @current_date = Date.today
    end
    
    @events = events_approved.by_date(@current_date).sort! { |a,b| a.date <=> b.date }
    
    if !(params[:search].blank?)
      @current_date = Date.today
      @events = events_approved.search(params[:search]).sort! { |a,b| a.date <=> b.date }
    end
    
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @boxers_applied = @event.boxers.where('club_id = ?', current_user)
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow "<strong>#{event.title}</strong></br>#{event.address}"
    end
    
    @gmaps_options = {
      "map_options" => {
        "auto_zoom" => false,
        "zoom" => 12,
        "center_latitude" => @event.latitude,
        "center_longitude" => @event.longitude
      },
      "markers" => {
        "data" => @hash
      }
    }
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize! :create, @event
  end

  # GET /events/1/edit
  def edit
    authorize! :update, @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize! :create, @event
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "#{I18n.t(:event, count: 1)} #{I18n.t(:request_successful)}" }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update    
    authorize! :update, @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "#{I18n.t(:event, count: 1)} #{I18n.t(:update_successful)}" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize! :destroy, @event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to calendar_url(@event.date) }
      format.json { head :no_content }
    end
  end
  
  def my_events
    if current_user then
      @club = current_user
      @events = current_user.get_events
      @host = "Veranstalter"
      @participate = "Teilnehmer"
      @past = "Vergangene"
      return
    else
      redirect_to new_session_path
    end
  end
  
  def participations
    #participations = @event.participations
    #@boxers = Array.new
    #participations.each do |participation|
      #@boxers << Boxer.find(participation.boxer_id)
    #end
    @boxers = @event.boxers
  end
  
  def manage
    authorize! :manage, @events
    if current_user.admin? then
      if params[:status] == "approved" then
        @events = Event.where(:approved => true)
      elsif params[:status] == "declined" then
        @events = Event.where(:approved => false)
      elsif params[:status] == "open" then
        @events = Event.where(:approved => nil)
      end
      
    end
  end
  
  def apply
    if current_user then
      authorize! :create, Boxer
      @events = [@event]
      #@boxers = current_user.boxers
      @boxers = Array.new
      current_user.boxers.each do |b|
        if b.participations.find_by_event_id(@event.id).nil? then
          @boxers << b
        end
      end
    else
      redirect_to new_session_path
    end
  end
  
  def send_application
    unless params[:boxer_ids].nil? then
      params[:boxer_ids].each do |id|
        @event.participations.build(:boxer_id => id)
      end
    end
    @event.save
    redirect_to @event
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
      :title, 
      :date, 
      :time_start, 
      :contact_name, 
      :contact_name_public, 
      :contact_phone, 
      :contact_phone_public, 
      :contact_mail, 
      :contact_mail_public, 
      :additional_info, 
      :gloves_available, 
      :catering_available, 
      :admission, 
      :admission_discounted, 
      :fee,
      :address, 
      :latitude, 
      :longitude, 
      :club_id,
      {:performance_class_ids => []}, 
      :approved, 
      schedule_items_attributes: [:id, :label, :time, :event_id, :_destroy]
      )
    end
    
end
