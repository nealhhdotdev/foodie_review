class Review < ActiveRecord::Base
    #belongs_to association with restaurants table
    belongs_to :restaurant
   
    
end
