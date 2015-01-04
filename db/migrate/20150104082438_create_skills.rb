class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :description # optional
      t.string :url # optional

      t.timestamps
    end
  end
end
