class ChangeApiUsersApiIdToI < ActiveRecord::Migration[5.2]
  def change
    remove_column :api_users, :api_id, :string
    add_column :api_users, :api_id, :integer
  end
end
