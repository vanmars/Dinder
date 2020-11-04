class CreateLikedRestaurantsAndRestaurants < ActiveRecord::Migration[5.2]
    def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :zomato_id
    end
  end
  
  def change
    create_table :liked_restaurants do |t|
      t.belongs_to :restaurant
      t.belongs_to :user
    end
  end
end
