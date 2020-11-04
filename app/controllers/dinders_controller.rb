class DindersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:like]
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
    restaurant = Zomato.new(params[:city])
    @food_photos = restaurant.get_food_images
    
    api_user = ApiUser.find(params[:api_user_id])
    api_user.destroy
    render :accept
  end

  def dinder
    @restaurant = Zomato.new(restaurant_params)
    restaurant = Zomato.new(params[:city])
    # city_id = restaurant.get_city_id
    @food_photos = restaurant.get_food_images
    @restaurants = Zomato.new(params[:city]).get_nearby_restaurants
    json = @restaurants.to_json
    @api = Api.create(:sender_id => current_user.id, :json => json, :user_ids => params[:user_ids].map(&:to_i))

    render :show
  end

  def like
    #swipe right
    @user = current_user
    
    if Restaurant.find_by_name(params[:name]).any?
      restaurant = Restaurant.find_by_name(params[:name]).first
    else
      restaurant = Restaurant.create(name: params[:name], address: params[:address], site: params[:site], zomato_id: params[:zomato_id].to_i)
    end
    @user.restaurants << restaurant
    # compare sent user

    # last_api = Api.all.last
    # sender = last_api.sender
    # if current_user != sender
    #   reciever = current_user
    #   puts "is receiver"
    # else
    #   puts "is sender"
    # end

    # join = ApiUser.where(api_id: last_api.id)
    # sent_to = join.first.user
    # sender variable
    # receiver variable

    # array = sender.restaurants & reciever.restaurants
    # dinder = array.sample
    # puts dinder
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
