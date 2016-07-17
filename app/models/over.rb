class Over < ActiveRecord::Base
  belongs_to :match
  has_many :balls
  accepts_nested_attributes_for :balls,
    :allow_destroy => true
    
   validates_associated :balls  
  
  def self.create_first(match)
    match_id = match.id
    @over = Over.new(match_id: match_id, number: 1)
            if @over.save
          #    @ball = Ball.new(match_id: match_id, delivery: 1, over_id: @over.id)
           #   @ball.save
             else
                Rails.logger.debug("over.rb: over record failed to write RAISE ERROR")
               end
  end
end
