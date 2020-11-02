class CreateFriendRequestsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests, id: false do |t|
      t.integer :user_id
      t.integer :friend_user_id
    end
    
    add_index(:friend_requests, [:user_id, :friend_user_id], :unique => true)
    add_index(:friend_requests, [:friend_user_id, :user_id], :unique => true)
  end

end
