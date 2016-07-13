class Player < ActiveRecord::Base
  belongs_to :team
   
  default_scope { order('surname ASC') }
  
  validates :surname, presence: true
  validates :first_name, presence: true
  
  def full_name
      "#{surname}, #{first_name}"
   end
   
 def name_by_team
    team = Team.find(self.team_id).name
     "#{team}: #{surname}, #{first_name}"
  end
 
    
end
