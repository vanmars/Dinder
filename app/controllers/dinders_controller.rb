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
    current_user.restaurants.destroy_all
    @api_id = params[:id]
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
    current_user.restaurants.destroy_all
    @restaurant = Zomato.new(restaurant_params)
    restaurant = Zomato.new(params[:city])
    # city_id = restaurant.get_city_id
    @food_photos = restaurant.get_food_images
    @restaurants = Zomato.new(params[:city]).get_nearby_restaurants
    json = @restaurants.to_json
    @api = Api.create(:sender_id => current_user.id, :json => json, :user_ids => params[:user_ids].map(&:to_i))
    @api_id = @api.id
    render :show
  end

  def like
    #swipe right
      @user = current_user
      @api = Api.find(params[:api_id])
      if Restaurant.find_by_name(params[:name]).any?
        restaurant = Restaurant.find_by_name(params[:name]).first
      else
        restaurant = Restaurant.create(name: params[:name], address: params[:address], site: params[:site], zomato_id: params[:zomato_id].to_i)
      end
      @user.restaurants << restaurant
      if params[:dinder] = 'reciever'
        puts params[:dinder]
        sender = @api.sender
        common_restaurants = sender.restaurants & @user.restaurants
        if common_restaurants.any?
          result = common_restaurants.last
          puts "you have both matched on result.name"
        end
      end
        


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
