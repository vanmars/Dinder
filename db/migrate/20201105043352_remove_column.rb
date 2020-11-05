class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :liked_restaurants, :user_id, :bigint
    add_column :liked_restaurants, :dinder_id, :bigint
  end
end
