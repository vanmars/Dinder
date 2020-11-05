class Match < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    belongs_to :sender, class_name: 'User'
    
end
