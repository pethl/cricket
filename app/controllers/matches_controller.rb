class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

 

 # GET /matches/1/edit
  def scoreboard
    @match = Match.find(params[:id])
   # @match.balls = Balls.where(match_id: match_id).where("done = 'f' OR done IS NULL")
   # over = Over.where(match_id: params[:id]).order( 'number DESC' ).first
  #  ball = match_incomplete_balls_per_over(params[:id], over.id)
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
        create_next_ball(@match)
        format.html { redirect_to scoreboard_match_path(@match), notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { redirect_to scoreboard_match_path(@match) }
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
      params.require(:match).permit(:date, :home, :away, :total_overs, :over_count, :first_to_bat, overs_attributes: [:id, :number, balls_attributes:[:id, :match_id, :number, :bowler, :batsman, :over_id, :delivery, :four, :six, :runs, :wicket, :catcher, :done, :declared, :out]])
    end
    
    #returns the last ball of an over not yet marked done from match
    def match_incomplete_balls_per_over(match_id, over_id)
      if match_id.blank? 
        else
         
     Ball.where(over_id: over_id).where("done = 'f' OR done IS NULL")
     end
    end
    
    def create_next_ball(match)
      match_id = match.id
      over = Over.where(match_id: match_id).order( 'number DESC' ).first
      
      if over.balls.any?
      ball = Ball.where(over_id: over, match_id: match_id).last
     
      #CREATE INITIAL BALL
      @ball = Ball.create(bowler: ball.bowler, match_id: ball.match_id)
       Rails.logger.debug("new_ball_object_first : #{@ball.inspect}")
      
       #UPDATE DELIVERY AND OVER ID
      if ball.delivery < 6 
       @ball[:delivery] = ball.delivery+1
       @ball[:over_id] = ball.over_id
       @ball[:bowler] = ball.bowler
       
      elsif over.number < match.total_overs
       @over = Over.create(match_id: match.id, number: over.number+1)
       @over.save
       @ball[:delivery] = 1
       @ball[:over_id] = @over.id
       @ball[:bowler] = ball.bowler
      end
        
       #@ball = Ball.create(bowler: ball.bowler, batsman: ball.batsman, over_id: @over.id, match_id: ball.match_id, delivery: 1)
       #UPDATE BATSMAN WHEN WICKET
       
       if [0,2,4,6].include? (ball.runs)
         @ball[:batsman] = ball.batsman
        else
         @ball[:batsman] = get_other_at_bat(match_id, ball.batsman)
         
          Rails.logger.debug("new_ball_object_with_other_batsman : #{@ball.inspect}")
       end
       
       if ball.wicket == true
         batsman= get_next_at_bat(match_id, ball.batsman)
          @ball[:batsman] = get_next_at_bat(match_id, ball.batsman)
         Rails.logger.debug("new_ball_object_new_batsman : #{@ball.inspect}")
         Rails.logger.debug("new_ball_object_new_batsman : #{batsman.inspect}")
         else
       end
       @ball.save
     
      else
        @ball = Ball.create(match_id: match.id, over_id: over.id, delivery: 1)
        @ball[:batsman] = Matchteam.where(team_id: (Match.find(match).first_to_bat), match_id: (match)).first.player_id
        @ball.save
     end
    end
    
    def get_next_at_bat(match_id, current_batsman)
      matchteam = Matchteam.where(match_id: match_id, player_id: current_batsman).first
      matchteam.update(is_out: true)
      
      return Matchteam.where(match_id: match_id, team_id: matchteam.team_id, is_out: nil).pluck(:player_id)[0,2].last
      
    end
    
    def get_other_at_bat(match_id, current_batsman)
      both = get_names_of_current_batsmen(match_id)
      a=[]
      a << current_batsman
      other_at_bat = both-a
      return other_at_bat.first
      
    end
    
end
