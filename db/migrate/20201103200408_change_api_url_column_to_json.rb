class ChangeApiUrlColumnToJson < ActiveRecord::Migration[5.2]
  def change
    remove_column :apis, :url, :string
    add_column :apis, :json, :string
  end
end
