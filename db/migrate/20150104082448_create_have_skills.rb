class CreateHaveSkills < ActiveRecord::Migration
  def change
    create_table :have_skills do |t|
      t.integer :skill_id, null: false
      t.integer :user_id, null: false
      t.string :expertise_level
      t.string :experience

      t.timestamps
    end
  end
end
