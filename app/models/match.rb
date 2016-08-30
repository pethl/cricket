class Match < ActiveRecord::Base
  has_many :overs
  has_many :balls, through: :overs
  accepts_nested_attributes_for :overs
  
  validates :date, presence: true
  validates :home, presence: true
  validates :away, presence: true
  validates :total_overs, presence: true 
  
  validates_associated :overs
   
   def match_name
     home = Team.find(self.home).short_name
     away = Team.find(self.away).very_short_name
       "#{(home)} v.s #{away}"
    end
    
end
