class HadSkill < ActiveRecord::Base
  validates :skill_id,
            null: false
  validates :user_id,
            null: false
  # validates :expertise_level,
  #           inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}

  belongs_to :user
  belongs_to :skill

  accepts_nested_attributes_for :skill
end
