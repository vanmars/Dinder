class Restaurant
  def initialize
    @city = city
  end
  
  def get_nearby_restaurants
    headers = { 
      'user-key' => ENV['API_KEY']
    }
    @response = HTTParty.get('https://developers.zomato.com/api/v2.1/search?entity_id=' + @city + '&entity_type=city&count=5', :headers => headers )
    @response['restaurants']
  end
end