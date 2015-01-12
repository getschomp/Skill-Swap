class CreateWantSkills < ActiveRecord::Migration
  def change
    create_table :want_skills do |t|
      t.integer :skill_id, null: false
      t.integer :user_id, null: false
      t.string :current_level
      t.string :desired_level
      t.string :why_description

      t.timestamps null: false
    end
  end
end
