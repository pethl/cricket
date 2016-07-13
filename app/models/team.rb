class Team < ActiveRecord::Base
  has_many :players
  
  def full_name
      "#{year} : #{name} #{rank} - #{institute}"
   end
   
   def short_name
       "#{year} : #{name} #{rank}"
    end
    
    def very_short_name
        "#{name} #{rank}"
     end
end
