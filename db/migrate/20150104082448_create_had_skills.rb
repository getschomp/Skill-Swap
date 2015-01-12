class CreateHadSkills < ActiveRecord::Migration
  def change
    create_table :had_skills do |t|
      t.integer :skill_id, null: false
      t.integer :user_id, null: false
      t.string :expertise_level #optional
      t.string :experience #optional

      t.timestamps
    end
  end
end
