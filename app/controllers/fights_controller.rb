class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  # GET /fights
  # GET /fights.json
  def index
    @event = Event.find(params[:event_id])
    #generate_fights(age_distance, weight_distance, same_club, championship, algorithm)
    @fights = @event.generate_fights(2, 2, false, false, 2).sort! { |a,b| a.priority <=> b.priority }
    @matching_value = 0
    @percentage_matched = 0
    matched_opponents = Array.new
    
    @fights.each do |f|
      @matching_value += f.priority
      b1 = f.opponent_red
      b2 = f.opponent_blue
      unless (matched_opponents.include?(b1)) then matched_opponents << b1 end
      unless (matched_opponents.include?(b2)) then matched_opponents << b2 end
    end
    
    unless @fights.empty?
      @matching_value /= @fights.count
      @percentage_matched = ((matched_opponents.count.to_f / @event.boxers.count.to_f) * 100).to_i
      
      # save matching statistics
      stat = MatchingStat.new #MatchingStat.find_by_event_id(@event) || MatchingStat.new
      stat.matching_value = @matching_value
      stat.percentage_matched = @percentage_matched
      stat.event_id = @event.id
      stat.save
    end
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
  end

  # GET /fights/1/edit
  def edit
  end

  # POST /fights
  # POST /fights.json
  def create
    @fight = Fight.new(fight_params)

    respond_to do |format|
      if @fight.save
        format.html { redirect_to @fight, notice: 'Fight was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fight }
      else
        format.html { render action: 'new' }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fights/1
  # PATCH/PUT /fights/1.json
  def update
    respond_to do |format|
      if @fight.update(fight_params)
        format.html { redirect_to @fight, notice: 'Fight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fights/1
  # DELETE /fights/1.json
  def destroy
    @fight.destroy
    respond_to do |format|
      format.html { redirect_to fights_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fight_params
      params.require(:fight).permit(:approved)
    end
end
