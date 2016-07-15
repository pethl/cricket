module ApplicationHelper
  
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

  def match_name(match_id)
    if match_id.blank? 
      else
    Match.find(match_id).match_name
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

  def latest_over(match_id)
    if match_id.blank?    
      else
   Over.where(match_id: match_id).order( 'number DESC' ).first
   end
  end
  
  def latest_ball(match)
    if match.blank?    
      else
        over = latest_over(match)
   Ball.where(over_id: over, match_id: match).last
   end
  end
  
  def latest_ball_done(match)
    if match.blank?    
      else
        over = latest_over(match)
   Ball.where(over_id: over, match_id: match, done: true).last
   end
  end
  
  #returns all the balls associated with an over
  def balls_per_over(over_id)
    if over_id.blank? 
      else
   Ball.where(over_id: over_id)
   end
  end
  
  #returns the last ball of an over not yet marked done
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
  
  def wickets_per_match(match_id)
    if match_id.blank? 
      else
   Ball.where(match_id: match_id, wicket: true).count
   end
  end
  
  def runs_scored_per_batsman(player_id, match_id)
    if match_id.blank? 
      else
         if Ball.where(match_id: match_id, batsman: player_id).any?
      Ball.where(match_id: match_id, batsman: player_id, done: true).pluck(:runs).sum
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
          "-"
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
  (latest_over(match).number == match.total_overs) && (latest_ball_done(match).delivery==6)
  end
  
  #TOO HARD NOT DONE THIS YET
  def get_names_of_current_batsmen(match_id)
    if match_id.blank? 
      else
      
   end
  end
  
  def get_first_batsman_from_match(match_id)
    Match.find(match_id).first.first_to_bat
  end
  
end
