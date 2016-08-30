class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
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
  
  
  
end
