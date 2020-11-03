class DindersController < ApplicationController
  
  def new
    # if params[:city]
    #   @restaurant = Restaurant.new(params[:city])
    #   @restaurant.get_nearby_restaurants
    # else
      # @restaurant = Restaurant.new
      # @restaurants = Restaurant.new.get_nearby_restaurants
    # end
  end

  def dinder
    @restaurant = Restaurant.new(restaurant_params)
    @restaurants = Restaurant.new(params[:city]).get_nearby_restaurants
    render :show
  end


  def approve
    #swipe right
  end

  def decline
    #swipe left
  end

  private
  def restaurant_params
    params.permit(:city, :friend)
  end
end
