class Restaurant < ApplicationRecord
  has_many :liked_restaurants
  has_many :winders, :through => :liked_restaurants
has_many :matches
  scope :find_by_name, -> (name_parameter) { where(name: name_parameter) }
end