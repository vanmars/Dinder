
class RestaurantsController < ApplicationController
  
  def explore 
    render :explore
  end

  def index
    # if params[:city]
    #   @restaurant = Restaurant.new(params[:city])
    #   @restaurant.get_nearby_restaurants
    # else
    #   render :new
    # end
  end
  
  def new
    # @restaurant = Restaurant.new(params[:city])
    # @restaurants = Restaurant.new.get_nearby_restaurants
  end

  def show

  end

end