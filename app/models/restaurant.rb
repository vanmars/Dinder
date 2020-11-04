class Restaurant < ApplicationRecord
  has_many :liked_restaurants
  has_many :users, :through => :liked_restaurants

  scope :find_by_name, -> (name_parameter) { where(name: name_parameter) }
end