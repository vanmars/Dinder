class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.belongs_to :user
      t.belongs_to :restaurant
      t.integer :sender_id
      t.timestamps
    end
  end
end
