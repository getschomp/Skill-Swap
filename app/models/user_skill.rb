class UserSkill < ActiveRecord::Base
  validates :skill_id,
            null: false,
            numericality: { only_integer: true }
  validates :user_id,
            null: false,
            numericality: { only_integer: true }
    # todo: add uniquness on skill_id user_id and known
  validates :known?,
            null: false,
            inclusion: { in: [true, false]}
  validates :current_level,
            inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}
  validates :description,
            length: { maximum: 300 },
            allow_blank: true

  # validates :teachers_skill,
  # inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}
  #to be replaced

  belongs_to :user
  belongs_to :skill

  accepts_nested_attributes_for :skill

  def find_matching_users
    # todo: remove
  end
end
