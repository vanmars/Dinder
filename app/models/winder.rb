class Winder < ApplicationRecord
    belongs_to :api
    belongs_to :user
    has_many :liked_restaurants
    has_many :restaurants, :through => :liked_restaurants

    scope :find_by_ids, -> (api_id, user_id) { where(api_id: api_id, user_id: user_id) }
end
