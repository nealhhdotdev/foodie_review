class Review < ActiveRecord::Base
    #belongs_to association with restaurants table
    belongs_to :restaurant
    before_save :set_restaurant_id
    
    
    def set_restaurant_id
        res = Restaurant.where(:name => :restaurant_id)
        res.each do |r|
        self.restaurant_id = r.id
    end
    end
    
    
end
