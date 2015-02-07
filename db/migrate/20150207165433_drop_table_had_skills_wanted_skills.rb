class DropTableHadSkillsWantedSkills < ActiveRecord::Migration
  def up
    drop_table :had_skills
    drop_table :wanted_skills

  end

  def down
    create_table :had_skills do |t|
      t.integer :skill_id, null: false
      t.integer :user_id, null: false
      t.string :expertise_level #optional
      t.string :experience #optional

      t.timestamps
    end

    create_table :wanted_skills do |t|
      t.integer :skill_id, null: false
      t.integer :user_id, null: false
      t.string :current_level #optional
      t.string :teachers_skill
      t.string :why_description #optional

      t.timestamps null: false
    end
    add_index(:had_skills, [:skill_id, :user_id], unique: true)
    add_index(:wanted_skills, [:skill_id, :user_id], unique: true)
  end
end
