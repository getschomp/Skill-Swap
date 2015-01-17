class WantedSkill < ActiveRecord::Base
  validates :skill_id,
  null: false
  validates :user_id,
  null: false
  # validates :current_level,
  # inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}
  # validates :teachers_skill,
  # inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}
  #to be replaced

  belongs_to :user
  belongs_to :skill

  accepts_nested_attributes_for :skill
end
