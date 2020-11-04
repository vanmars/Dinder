class Restaurant
  attr_accessor :city

  def initialize(city)
    @city = city.to_s
  end
  
  def get_nearby_restaurants
    headers = { 
      'user-key' => ENV['API_KEY']
    }
    @response = HTTParty.get('https://developers.zomato.com/api/v2.1/search?entity_id=' + @city + '&entity_type=city&count=5', :headers => headers)
    @response['restaurants']
  end

  def get_city_id
    headers = { 
      'user-key' => ENV['API_KEY']
    }
    response = HTTParty.get('https://developers.zomato.com/api/v2.1/cities?q=' + @city + '&count=1', :headers => headers)
    response['location_suggestions'].first['id']
  end

  def get_cuisine_for_city(city_id)
    headers = { 
      'user-key' => ENV['API_KEY']
    }
    response = HTTParty.get('https://developers.zomato.com/api/v2.1/cuisines?city_id=' + city_id.to_s, :headers => headers)
    result = []
    response['cuisines'].each do | cuisine |
      result.push(cuisine['cuisine']['cuisine_name'])
    end
    result
  end

  def get_restaurants_trending(city_id)
    headers = { 
      'user-key' => ENV['API_KEY']
    }
    response = HTTParty.get('https://developers.zomato.com/api/v2.1/search?entity_id=' + city_id.to_s + '&entity_type=city&count=10&collection_id=1', :headers => headers)
    response['restaurants']
  end

  def get_url
    headers = { 
      'user-key' => ENV['API_KEY']
    }
    @response = HTTParty.get('https://developers.zomato.com/api/v2.1/search?entity_id=' + @city + '&entity_type=city&count=5', :headers => headers)
    @reponse
  end

  def search(city_id, name)
    headers = { 
      'user-key' => ENV['API_KEY']
    }
    response = HTTParty.get('https://developers.zomato.com/api/v2.1/search?entity_id=' + city_id.to_s + '&entity_type=city&q='+ name.to_s + '&count=15', :headers => headers)
    response['restaurants']
  end

  def get_food_images
    response = HTTParty.get('https://api.unsplash.com/topics/food-drink/photos?per_page=200&client_id=' + ENV['UNSPLASH_API_KEY'])
  end  
end




















































































































































































































