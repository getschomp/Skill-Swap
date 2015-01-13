class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :zipcode, null: false
    end
    # add_index(:locations, [:state, :city, :country], :unique => true)
  end
end
