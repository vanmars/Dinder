class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :sender_id

      t.timestamps
    end
    create_table :recipients do |t|
      t.string :message_id
      t.integer :user_id

      t.timestamps
    end

  end
end
