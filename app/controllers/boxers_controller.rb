class BoxersController < ApplicationController
  before_action :set_boxer, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource except: [:create, :my_boxers]
  
  # GET /boxers
  # GET /boxers.json
  def index
    @boxers = Boxer.all
  end

  # GET /boxers/1
  # GET /boxers/1.json
  def show
    unless current_user
      redirect_to login_path
    end
  end

  # GET /boxers/new
  def new
    if current_user then
      @boxer = Boxer.new
      authorize! :create, @boxer
    else
      redirect_to login_path
    end
  end

  # GET /boxers/1/edit
  def edit
    if current_user then
      authorize! :update, @boxer
    else
      redirect_to login_path
    end
  end

  # POST /boxers
  # POST /boxers.json
  def create
    @boxer = Boxer.new(boxer_params)
    authorize! :create, @boxer
    respond_to do |format|
      if @boxer.save
        format.html { redirect_to session[:return_to], notice: I18n.t('messages.creation_successful', :model => Boxer.model_name.human) }
        format.json { render action: 'show', status: :created, location: @boxer }
      else
        format.html { render action: 'new' }
        format.json { render json: @boxer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boxers/1
  # PATCH/PUT /boxers/1.json
  def update
    authorize! :update, @boxer
    respond_to do |format|
      if @boxer.update(boxer_params)
        format.html { redirect_to @boxer, notice: I18n.t('messages.update_successful', :model => Boxer.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @boxer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxers/1
  # DELETE /boxers/1.json
  def destroy
    authorize! :destroy, @boxer
    @boxer.destroy
    respond_to do |format|
      format.html { redirect_to boxers_url, notice: I18n.t('messages.deletion_successful', :model => Boxer.model_name.human) }
      format.json { head :no_content }
    end
  end
  
  def my_boxers
    if current_user then
      @club = current_user
      @boxers = current_user.boxers
      session[:return_to] = my_boxers_path
      return
    else
      redirect_to login_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boxer
      @boxer = Boxer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boxer_params
      params.require(:boxer).permit(:first_name, :last_name, :date_of_birth, :weight, :fights_won, :fights_lost, :fights_drawn, :gender, :active, 
      :club_id, :age_class_id, :weight_class_id)
    end
end
