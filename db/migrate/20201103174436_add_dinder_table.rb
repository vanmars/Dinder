class AddDinderTable < ActiveRecord::Migration[5.2]
  def change
    create_table :apis do |t|
      t.string :url
      t.integer :sender_id

      t.timestamps
    end

    create_table :api_users do |t|
      t.string :api_id
      t.integer :user_id
      
      t.timestamps
    end

  end
end