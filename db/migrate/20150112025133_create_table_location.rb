class CreateTableLocation < ActiveRecord::Migration
  def change
    create_table :table_locations do |t|
      t.string :state, null: false
      t.state :city, null: false
    end
  end
end
