class Restaurant < ActiveRecord::Base
    #many to many association with reviews table
    has_many :reviews
end
