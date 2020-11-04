class Restaurant < ApplicationRecord
  has_many :liked_restaurants
  has_many :users, :through => :liked_restaurants
end