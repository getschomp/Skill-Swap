class CreateWantedSkills < ActiveRecord::Migration
  def change
    create_table :wanted_skills do |t|
      t.integer :skill_id, null: false
      t.integer :user_id, null: false
      t.string :current_level #optional
      t.string :teachers_skill
      t.string :why_description #optional

      t.timestamps null: false
    end
  end
end
