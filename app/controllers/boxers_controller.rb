class BoxersController < ApplicationController
  before_action :set_boxer, only: [:show, :edit, :update, :destroy]

  # GET /boxers
  # GET /boxers.json
  def index
    @boxers = Boxer.all
  end

  # GET /boxers/1
  # GET /boxers/1.json
  def show
  end

  # GET /boxers/new
  def new
    @boxer = Boxer.new
  end

  # GET /boxers/1/edit
  def edit
  end

  # POST /boxers
  # POST /boxers.json
  def create
    @boxer = Boxer.new(boxer_params)

    respond_to do |format|
      if @boxer.save
        format.html { redirect_to @boxer, notice: 'Boxer was successfully created.' }
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
    respond_to do |format|
      if @boxer.update(boxer_params)
        format.html { redirect_to @boxer, notice: 'Boxer was successfully updated.' }
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
    @boxer.destroy
    respond_to do |format|
      format.html { redirect_to boxers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boxer
      @boxer = Boxer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boxer_params
      params.require(:boxer).permit(:first_name, :last_name, :date_of_birth, :weight, :fights_won, :fights_lost, :fights_drawn, :gender, :active, :club_id)
    end
end
