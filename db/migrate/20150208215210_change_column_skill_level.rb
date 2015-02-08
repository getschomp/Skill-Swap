class ChangeColumnSkillLevel < ActiveRecord::Migration
  def up
    remove_column :user_skills, :skill_level
    add_column :user_skills, :level, :string
  end
  def down
    add_column :user_skills, :skill_level, :string
    remove_column :user_skills, :level
  end
end
