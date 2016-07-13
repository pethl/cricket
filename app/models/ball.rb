class Ball < ActiveRecord::Base
  belongs_to :over
  belongs_to :match
  before_save :ball_validation_rules 
#  validates :bowler, presence: true
#  validates :batsman, presence: true
  validates :match_id, presence: true
  validates :over_id, presence: true
  validates :delivery, presence: true
  validate :four_xor_six
  
  
   default_scope { order('delivery ASC') }

   private
   
   def ball_validation_rules
     if self.four == true
       self.runs = 4
     end
     
     if self.six == true
       self.runs = 6
     end
     
     if ((wicket == true) && (out.blank?))
       errors.add(:base, "Specify type of out for this wicket")
     end
   end

   def four_xor_six
     unless four.blank? && six.blank?
       if (four == true && six ==true)
       errors.add(:base, "Ball can be four or six, not both")
     end
   end
   end
end
