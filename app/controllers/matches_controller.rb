class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

 

 # GET /matches/1/edit
  def scoreboard
    @match = Match.find(params[:id])
    over = Over.where(match_id: params[:id]).order( 'number DESC' ).first
    ball = match_incomplete_balls_per_over(params[:id], over.id)
  end

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        Matchteam.copy_team(@match)
        Over.create_first(@match)
        
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:date, :home, :away, :total_overs, :over_count, :first_to_bat, balls_attributes:[:id, :match_id, :number, :bowler, :batsman, :over_id, :delivery, :four, :six, :runs, :wicket, :catcher, :done, :declared, :out])
    end
    
    #returns the last ball of an over not yet marked done from match
    def match_incomplete_balls_per_over(match_id, over_id)
      if match_id.blank? 
        else
         
     Ball.where(over_id: over_id).where("done = 'f' OR done IS NULL")
     end
    end
    
end
