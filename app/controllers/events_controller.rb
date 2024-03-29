# encoding: utf-8
require "prawn"
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :send_application, :undo_application, :fights, :download_fightlist]
  before_action :parse_time, only: [:update, :create]
  
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
    @boxers = @event.boxers
    @my_boxers = Array.new
    if current_user
      current_user.boxers.each do |b|
        unless b.events.include?(@event)
          @my_boxers << b
        end
      end
    end
    
    @fights = @event.fights
    @stat = @event.calc_stat(@fights)
    
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.location.latitude
      marker.lng event.location.longitude
      marker.infowindow "<strong>#{event.title}</strong>"
    end
    
    @gmaps_options = {
      "map_options" => { "auto_zoom" => false, "zoom" => 12, "center_latitude" => @event.location.latitude, "center_longitude" => @event.location.longitude },
      "markers" => { "data" => @hash }
    }
    
    session[:return_to] = event_path(@event)
  end

  # GET /events/new
  def new
    if current_user then
      @event = Event.new
      authorize! :create, @event
      @event.build_location(:event_id => @event.id)
    else
      redirect_to login_path
    end
  end

  # GET /events/1/edit
  def edit
    if current_user then
      authorize! :update, @event
      @event.location ||= @event.build_location(:event_id => @event.id)
    else
      redirect_to login_path
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize! :create, @event
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: I18n.t('messages.request_successful', :model => Event.model_name.human) }
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
        format.html { redirect_to @event, notice: I18n.t('messages.update_successful', :model => Event.model_name.human) }
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
      format.html { redirect_to my_events_path("host"), notice: I18n.t('messages.deletion_successful', :model => Event.model_name.human) }
      format.json { head :no_content }
    end
  end
  
  def my_events
    if current_user then
      params[:role] ||= "host"
      @club = current_user
      if params[:role] == "host" then
        @events = @club.get_hosting_events.order("approved").reverse_order
      elsif params[:role] == "participate" then
        @events = @club.get_participating_events
      elsif params[:role] == "archive" then
        @events = @club.get_past_events
      end
      
      return
    else
      redirect_to login_path
    end
  end
  
  def manage
    if current_user then
      authorize! :approve, Event
      if params[:status] == "approved" then
        @events = Event.where(:approved => true)
      elsif params[:status] == "declined" then
        @events = Event.where(:approved => false)
      elsif params[:status] == "open" then
        @events = Event.where(:approved => nil)
      end
    else
      redirect_to login_path
    end
  end
  
  def send_application
    authorize! :apply, @event
    unless params[:boxer_ids].nil? then
      invalid_count = 0
      params[:boxer_ids].each do |id|
        boxer = Boxer.find_by_id(id)
        if boxer.valid?
          @event.boxers << boxer
        else
          invalid_count += 1
        end
      end
      @event.save
      if invalid_count > 0
        redirect_to event_path(@event, :tab => "3")
        flash[:alert] = "#{invalid_count} Boxer konnte(n) nicht angemeldet werden. Bitte überprüfen Sie die Vollständigkeit der Angaben und versuchen es dann erneut."
      else
        redirect_to event_path(@event, :tab => "3"), notice: I18n.t('messages.successful', :item => "Anmeldung der Boxer")
      end
    end
  end
    
  def undo_application
    boxer = Boxer.find_by_id(params[:boxer_id])
    authorize! :apply, @event
    @event.boxers.delete(boxer)
    fights = @event.fights.where('opponent_red = ? OR opponent_blue = ?', boxer, boxer)
    @event.fights.destroy(fights)
    respond_to do |format|
      format.html { redirect_to event_path(@event, :tab => "3"), notice: I18n.t('messages.successful', :item => "Abmeldung des Boxers") }
      format.json { head :no_content }
    end
  end
  
  def fights
    ad = params[:age_distance] ? params[:age_distance].to_i : 2
    wd = params[:weight_distance] ? params[:weight_distance].to_i : 2
    sc = params[:same_club] == "1"
    cs = params[:championship] == "1"
    alg = 2
    
    # delete existing fights that have not been approved yet
    @event.fights.where(:approved => false).delete_all
    
    @boxers_left = @event.boxers.dup
    
    @event.fights.each do |fight| # for each approved fight
      # reject boxers that are already assigned
      @boxers_left = @boxers_left.reject! {|boxer| [fight.opponent_red, fight.opponent_blue].include?(boxer) || [fight.opponent_red, fight.opponent_blue].include?(boxer) }
    end
    
    @event.generate_fights(@boxers_left, ad, wd, sc, cs, alg)
    redirect_to event_path(@event, :tab => "4")
  end
  
  def download_fightlist
    fightlist = @event.fights.where(:approved => true)
    unless fightlist.empty?
      send_data generate_pdf(@event.title, fightlist),
      filename: "#{@event.title.downcase.tr(" ", "_")}_kampfliste.pdf",
      type: "application/pdf"
    else
      redirect_to event_path(@event, :tab => 4)
      flash[:alert] = "Es wurden noch keine Kämpfe bestätigt."
    end
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
      :latitude, 
      :longitude, 
      :club_id,
      {:performance_class_ids => []}, 
      :approved,
      :deadline,
      schedule_items_attributes: [:id, :label, :time, :event_id, :_destroy],
      location_attributes: [:street, :number, :zip, :city, :country, :club_id, :event_id, :_destroy]
      )
    end
    
    def parse_time
      if params[:event] and params[:event][:schedule_items_attributes] then
        params[:event][:schedule_items_attributes].values.each do |schedule_item|
          schedule_item.parse_time_select! :time
        end
      end
    end
    
    def generate_pdf(name, fightlist)
      Prawn::Document.new do
        text "Kampfliste für " + name
        fightlist.each do |f|
          text f.opponent_red.get_name + " vs. " + f.opponent_blue.get_name
        end
      end.render
    end
    
end
