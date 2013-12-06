class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource :except => [:create, :my_profile]
  #force_ssl
  
  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all.order("zip")
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
  end

  # GET /clubs/new
  def new
    @club = Club.new
    authorize! :create, @club
  end

  # GET /clubs/1/edit
  def edit
    authorize! :update, @club
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    authorize! :create, @club
    respond_to do |format|
      if @club.save
        format.html { redirect_to my_profile_path(@club), notice: 'Signup successful.' }
        session[:club_id] = @club.id #log in
        format.json { render action: 'show', status: :created, location: @club }
      else
        format.html { render action: 'new' }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    authorize! :update, @club
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to my_profile_path(@club), notice: 'Club was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    authorize! :destroy, @club
    @club.destroy
    session[:club_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your club profile was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def my_profile
    if current_user then
      @club = current_user and return
    else
      redirect_to new_session_path
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.    
    def club_params
      params.require(:club).permit(:name, :street, :street_no, :zip, :city, :website, :contact_name, :contact_phone,
      :contact_mail, :password, :password_confirmation,
      coaches_attributes: [:id, :first_name, :last_name, :club_id, :_destroy],
      trainings_attributes: [:id, :weekday_id, :time_start, :time_end, :description, :club_id, :_destroy]
      )
    end
    
end
