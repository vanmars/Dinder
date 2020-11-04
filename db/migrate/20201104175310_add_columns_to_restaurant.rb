class AddColumnsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :site, :string
  end
end
