class CreateDinders < ActiveRecord::Migration[5.2]
  def change
    create_table :dinders do |t|
      t.belongs_to :api
      t.belongs_to :user

      t.timestamps
    end
  end
end
