class RestaurantsController < ApplicationController
  
  def explore 
    restaurant = Zomato.new(current_user.city)
    city_id = restaurant.get_city_id
    @food_photos = restaurant.get_food_images
    @cuisines = restaurant.get_cuisine_for_city(city_id)
    @restaurants = restaurant.get_restaurants_trending(city_id)
    if params[:city_search] && params[:name_search] 
      restaurant2 = Zomato.new(params[:city_search])
      city_id2 = restaurant2.get_city_id
      @restaurants2 = restaurant2.search(city_id2, params[:name_search])
    end
    render :explore
  end

end