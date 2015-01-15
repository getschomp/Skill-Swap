class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.string :category
      t.string :description # optional
      t.string :url # optional

      t.timestamps
    end
    add_index :skills, :name, unique: true

  end
end
