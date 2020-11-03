class DindersController < ApplicationController
  
  def new
    # @restaurants = Restaurant.new
    @api = Api.new
    @friends = User.all
  end

  def index
    @dinders = ApiUser.where(:user_id => current_user.id)
  end

  def accept
    api_call = Api.find(params[:id])
    json = api_call.json
    parsed = JSON.parse(json)
    @restaurants = parsed
    # binding.pry
    render :accept
  end

  def dinder
    @restaurant = Restaurant.new(restaurant_params)

    restaurant = Restaurant.new(params[:city])
    # city_id = restaurant.get_city_id
    @food_photos = restaurant.get_food_images


    @restaurants = Restaurant.new(params[:city]).get_nearby_restaurants
    
    json = @restaurants.to_json
    
    @api = Api.create(:sender_id => current_user.id, :json => json, :user_ids => params[:user_ids].map(&:to_i))
    @user = current_user
    @friends = User.all
    render :show
  end

  def approve
    #swipe right
  end

  def decline
    #swipe left
  end

  def reject
    api_user = ApiUser.find(params[:api_user_id])
    api_user.destroy
    redirect_to '/dinders'
  end

  private
  def restaurant_params
    params.permit(:city, :friend)
  end

  # def api_params
  #   params.require(:api).permit(:json, :sender_id, user_ids: [])
  # end
end
# url = 'http://localhost:3000/dinders/dinder?city=' + @city + ''


# http://localhost:3000/dinders/dinder?city=1240&user_ids%5B%5D=1&user_ids%5B%5D=2&user_ids%5B%5D=3&user_ids%5B%5D=4&user_ids%5B%5D=5&commit=Submit