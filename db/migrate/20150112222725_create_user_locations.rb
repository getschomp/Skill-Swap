class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.integer :location_id
      t.integer :user_id
    end
  end
end
