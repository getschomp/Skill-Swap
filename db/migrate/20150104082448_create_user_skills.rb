class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.integer :skill_id, null: false
      t.integer :user_id, null: false
      t.string :have_or_want, null: false
      t.string :expertise_level

      t.timestamps
    end
  end
end
