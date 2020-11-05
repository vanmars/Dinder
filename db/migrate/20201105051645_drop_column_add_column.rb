class DropColumnAddColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :liked_restaurants, :dinder_id, :bigint
    add_column :liked_restaurants, :winder_id, :bigint
  end
end
