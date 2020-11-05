class MatchesController < ApplicationController
  def index
    @matches = current_user.matches
  end

  def match
    restaurant = Zomato.new(params[:city])
    @food_photos = restaurant.get_food_images
    @matches = current_user.matches
  end
end
