class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :state, null: false
      t.string :city, null: false
    end
  end
end
