class RestaurantsController < ApplicationController
  
  def explore 
    restaurant = Restaurant.new(current_user.city)
    @city_id = restaurant.get_city_id
    @cuisines = restaurant.get_cuisine_for_city(@city_id)
    @restaurants = restaurant.get_restaurants_trending(@city_id)
    # if params[:search]
    #   Restaurant.search(params[:search])
    # end
    render :explore
  end

end