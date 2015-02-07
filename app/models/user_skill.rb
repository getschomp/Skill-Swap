class UserSkill < ActiveRecord::Base
  validates :skill_id,
            null: false
  validates :user_id,
            null: false,
            uniqueness: { scope: :skill_id,
            message: "You can't add the same skill twice" }


  # validates :current_level,
  # inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}
  # validates :teachers_skill,
  # inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}
  #to be replaced

  belongs_to :user
  belongs_to :skill

  accepts_nested_attributes_for :skill

  def find_matching_users

  end
end
