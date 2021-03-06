class BallsController < ApplicationController
  before_action :set_ball, only: [:show, :edit, :update, :destroy]
  
  
  def first_ball
    @ball = Ball.new(ball_params)
    @ball[:batsman] = Matchteam.where(team_id: (Match.find(ball_params[:match_id]).first_to_bat), match_id: (ball_params[:match_id])).first.player_id
    @ball.save
    redirect_to scoreboard_match_path(@ball.match_id), notice: 'Ball was successfully created.' 
  end
  
  # GET /balls
  # GET /balls.json
  def index
    @balls = Ball.all
  end

  # GET /balls/1
  # GET /balls/1.json
  def show
  end

  # GET /balls/new
  def new
    @ball = Ball.new
  end

  # GET /balls/1/edit
  def edit
    
  end

  # POST /balls
  # POST /balls.json
  def create
    @ball = Ball.new(ball_params)

    respond_to do |format|
      if @ball.save
        format.html { redirect_to @ball, notice: 'Ball was successfully created.' }
        format.json { render :show, status: :created, location: @ball }
      else
        format.html { render :new }
        format.json { render json: @ball.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /balls/1
  # PATCH/PUT /balls/1.json
  def update
    respond_to do |format|
      if @ball.update(ball_params)
        format.html { redirect_to @ball, notice: 'Ball was successfully updated.' }
        format.json { render :show, status: :ok, location: @ball }
      else
        format.html { render "matches/scoreboard"}
        format.json { render json: @ball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balls/1
  # DELETE /balls/1.json
  def destroy
    @ball.destroy
    respond_to do |format|
      format.html { redirect_to balls_url, notice: 'Ball was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ball
      @ball = Ball.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ball_params
      params.require(:ball).permit(:bowler, :batsman, :over_id, :match_id, :delivery, :four, :six, :runs, :wicket, :catcher, :done, :declared, :out, :no_ball, :wide, :counter)
    end
    
   
end
