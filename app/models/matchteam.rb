class Matchteam < ActiveRecord::Base
  
  default_scope { order('batting_order ASC') }
  
  
  def self.copy_team(match)
    match_id = match.id
    hometeam_id = match.home
    awayteam_id = match.away
    homeplayers = Player.where(team_id: hometeam_id).pluck(:id).sort
    awayplayers = Player.where(team_id: awayteam_id).pluck(:id).sort
    
    i = 0
    while i < homeplayers.count 
      @matchteam = Matchteam.new(match_id: match_id, player_id: homeplayers[i], team_id:hometeam_id, batting_order:i+1)
              if @matchteam.save
               else
                 end
              i= (i+1)   
            end
            
    j=0
    while j < awayplayers.count 
      @matchteam = Matchteam.new(match_id: match_id, player_id: awayplayers[j], team_id:awayteam_id, batting_order:j+1)
              if @matchteam.save
               else
                 end
              j= (j+1)   
            end
    
    
  end
    
end
