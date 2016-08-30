module ApplicationHelper
  
  def match_name(match_id)
    if match_id.blank? 
      else
    Match.find(match_id).match_name
    end
  end
  
  def team_full_name(team_id)
    if team_id.blank? 
      else
    Team.find(team_id).full_name
    end
  end
  
  def team_name(team_id)
    if team_id.blank? 
      else
    Team.find(team_id).name
  end
end

  def player_name(player_id)
    if player_id.blank? 
      else
    Player.find(player_id).full_name
  end
  end
  
  def player_name_abbrv(player_id)
    if player_id.blank? 
      else
    player = Player.find(player_id)
    return player.surname + ', ' + player.first_name[0,1] 
  end
  end
  
  def player_batting_order(player_id, match_id)
    if player_id.blank? 
      else
    Matchteam.where(player_id: player_id, match_id: match_id).first.batting_order
  end
  end

  # get the current over of a match
  def over_number(over_id)
    if over_id.blank?    
      else
   Over.where(id: over_id).first.number
   end
  end

  # get the current over of a match
  def latest_over(match_id)
    if match_id.blank?    
      else
   Over.where(match_id: match_id).order( 'number DESC' ).first
   end
  end
  
   # get the current ball of the current over of a match - ball will be inplay - created not yet saved
  def latest_ball(match)
    if match.blank?    
      else
        over = latest_over(match)
   Ball.where(over_id: over, match_id: match).last
   end
  end
  
  # get the last ball of the current over of a match, whether complete or incomplete
  def latest_ball_done(match)
    if match.blank?    
      else
        over = latest_over(match)
        if Ball.where(over_id: over.id, match_id: match.id, done: true).any?
   ball = Ball.where(over_id: over.id, match_id: match.id, done: true).last
   return ball
 else
   Ball.where(over_id: over.id, match_id: match.id).last
 end
   end
  end
  
  #returns all the balls associated with an over
  def balls_per_over(over_id)
    if over_id.blank? 
      else
   Ball.where(over_id: over_id)
   end
  end
  
  #returns the last ball of an over not yet marked done - last ball in play
  def incomplete_balls_per_over(over_id)
    if over_id.blank? 
      else
   Ball.where(over_id: over_id).where("done = 'f' OR done IS NULL")
   end
  end
  
  #returns the last ball of an over not yet marked done from match
  #duplicated in match controller
  def match_incomplete_balls_per_over(match_id)
    if match_id.blank? 
      else
        over_id = latest_over(match_id)
   Ball.where(over_id: over_id).where("done = 'f' OR done IS NULL")
   end
  end
  
  
  def runs_scored_per_batsman(player_id, match_id)
    if match_id.blank? 
      else
         if Ball.where(match_id: match_id, batsman: player_id).any?
      Ball.where(match_id: match_id, batsman: player_id, done: true).pluck(:runs).sum
    else
      0
      end
   end
  end
  
  def runs_scored_per_bowler(player_id, match_id)
    if match_id.blank? 
      else
        if Ball.where(match_id: match_id, bowler: player_id).any?
      Ball.where(match_id: match_id, bowler: player_id, done: true).pluck(:runs).sum
    end
   end
  end
  
  def out_per_batsman(player_id, match_id)
    if match_id.blank? 
      else
        if Ball.where(match_id: match_id, batsman: player_id, wicket: true).any?
          Ball.where(match_id: match_id, batsman: player_id, wicket: true, done: true).first.out
        else
          
        end
   end
  end
  
  def out_per_bowler(player_id, match_id)
    if match_id.blank? 
      else
        if Ball.where(match_id: match_id, bowler: player_id, wicket: true).any?
          Ball.where(match_id: match_id, bowler: player_id, wicket: true).count
        else
          0
        end
   end
  end
  
  def get_hometeam_by_match(match_id)
    home_id = Match.find(match_id).home
    if match_id.blank? 
      else
      Matchteam.where(match_id: match_id, team_id: home_id).pluck(:player_id)
   end
  end
  
  def get_awayteam_by_match(match_id)
    away_id = Match.find(match_id).away
    if match_id.blank? 
      else
      Matchteam.where(match_id: match_id, team_id: away_id).pluck(:player_id)
     # players = Matchteam.where(match_id: 51, team_id: 54).pluck(:player_id)
   end
  end
  
  def get_any_team_by_match(match_id,team_id)
   
    if match_id.blank? 
      else
      Matchteam.where(match_id: match_id, team_id: team_id).pluck(:player_id)
   end
  end
  
  # THIS MAY BE DUPLICATE AND UNNECESSARY as not what it says on tin
  def get_first_team_to_bat_by_match(match_id)
    if match_id.blank?  
      else
         team_id = Match.find(match_id).first_to_bat
      Matchteam.where(match_id: match_id, team_id: team_id).pluck(:player_id)
   end
  end
  
  def get_second_team_to_bat_by_match(match_id)
    if match_id.blank? 
      else
        match = Match.find(match_id)
        if match.home == match.first_to_bat
          second_team = match.away
        else
          second_team = match.home
        end
      Matchteam.where(match_id: match_id, team_id: second_team).pluck(:player_id)
   end
  end
  
  def get_runs_batted_by_hometeam_by_match(match_id)
    if match_id.blank? 
      else
        home_team_ids = get_hometeam_by_match(match_id)
        if Ball.where("batsman IN (?)", home_team_ids).count > 0
      Ball.where("batsman IN (?)", home_team_ids).where(match_id: match_id, done: true).pluck(:runs).sum
    else
      0
    end
   end
  end
  
  def get_runs_batted_by_awayteam_by_match(match_id)
    if match_id.blank? 
      else
        away_team_ids = get_awayteam_by_match(match_id)
      Ball.where("batsman IN (?)", away_team_ids).where(match_id: match_id, done: true).pluck(:runs).sum
   end
  end
  
  def end_of_match(match) 
    match_id = match.id
  (latest_over(match).number == match.total_overs) && (latest_ball_done(match).delivery==6)
  end
  
  def get_wickets_lost_by_hometeam_by_match(match_id)
    if match_id.blank? 
      else
        home_team_ids = get_hometeam_by_match(match_id)
        if Ball.where("batsman IN (?)", home_team_ids).count > 0
      Ball.where("batsman IN (?)", home_team_ids).where(match_id: match_id, wicket: true).count
    else
      0
    end
   end
  end
  
  def get_wickets_lost_by_awayteam_by_match(match_id)
    if match_id.blank? 
      else
        away_team_ids = get_awayteam_by_match(match_id)
        if Ball.where("batsman IN (?)", away_team_ids).count > 0
          Ball.where("batsman IN (?)", away_team_ids).where(match_id: match_id, wicket: true).count
    else
      0
    end
   end
  end
  
 
  
  #WORK TO DO FOE DECLARED
  def get_names_of_current_batsmen(match_id)
    match = Match.find(match_id)
    if match.first_to_bat == false
      else
       
        #Get all balls where out or declared (declared, batsman not out but no longer batting)
        if Ball.where(match_id: match, wicket: true, ).any?
          wickets = Ball.where(match_id: match_id, wicket: true).pluck(:batsman)
        else
          wickets= []
        end
       # declared = Ball.where(match_id: match_id, declared: true).pluck(:batsman)
       # out_batsman= wickets+declared
        
        #Get all batsmen in order
        first_team = get_first_team_to_bat_by_match(match_id)
        second_team = get_second_team_to_bat_by_match(match_id)
        
        remaining_batsmen_first= first_team-wickets
        if remaining_batsmen_first.count < 2
          remaining_batsmen_second= second_team-wickets
          return remaining_batsmen_second[0,2]
        else
         return remaining_batsmen_first[0,2]
       end
   end
  end
  
  def get_first_batsman_from_match(match_id)
    Match.find(match_id).first.first_to_bat
  end
  
  def check_balls_have_bowlers(match_id)
    balls = Ball.where(match_id: match_id, done: true)
    @error = 0
    balls.each do |ball|
      if ball.bowler.blank?
        @error =1  
     end
   end
    if @error == 1
      true
    else
      false
    end
  end
  
  def get_balls_with_no_bowlers(match_id)
    Ball.where(match_id: match_id, bowler: nil, done: true)
  end
  
  def whose_in_bat(match)
    latest_over = latest_over(match.id).number
    total_overs = match.total_overs
    second_half = (total_overs/2)+1
    if latest_over <second_half
      match.first_to_bat
     else
       if match.home == match.first_to_bat
         match.away
       else
         second_team = match.home
       end 
     end
  end
  
  def whose_bowling(match)
    latest_over = latest_over(match.id).number
    total_overs = match.total_overs
    second_half = (total_overs/2)+1
    if latest_over < second_half
      if match.home == match.first_to_bat
        match.away
      else
        second_team = match.home
      end 
     else
       match.first_to_bat
     end
  end
  
  def latest_wicket_for_team(match)  
    
    if Ball.where(match_id: match, wicket: true, ).any?
      
    last_wicket = Ball.where(match_id: match, wicket: true).order( 'id ASC' ).last
    batsman = last_wicket.batsman
    ball_id =last_wicket.id
    return runs_to_last_wicket = Ball.where("match_id= ? AND id < ?", match, ball_id).order( 'id DESC' ).pluck(:runs).sum
  else
    '-'
  end 
  end
  
  def bowlers_per_team(match_id)
    team_id = whose_bowling(match_id)
    team = get_any_team_by_match(match_id, team_id)
    bowlers = Ball.where(match_id: match_id).where("bowler IN (?)", team).pluck(:bowler)
    return bowlers.uniq
  end
  
  def get_overs_bowled_by_bowler(bowler, match_id)
    balls = Ball.where(match_id: match_id, bowler: bowler, done: true).count
    #, no_ball: false, wide: false
    
    overcount = 0
    unless balls < 6
      if balls - 6 >0
        overcount = overcount +1
        balls = balls-6
      else
      end 
    end
    
    return overcount.to_s + "." + balls.to_s
  end
    
end
