class Winder < ApplicationRecord
    belongs_to :api
    belongs_to :user
    has_many :liked_restaurants
    has_many :restaurants, :through => :liked_restaurants
end
