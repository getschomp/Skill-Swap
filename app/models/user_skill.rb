class UserSkill < ActiveRecord::Base

  validates :skill_id,
            null: false,
            numericality: { only_integer: true }
  validates :user_id,
            null: false,
            numericality: { only_integer: true }
  validates :known?,
            null: false,
            inclusion: { in: [true, false]}

  validates :level,
            inclusion: { in: ["", "Beginner", "Intermediate", "Advanced"] }

  validates :description,
            length: { maximum: 300 },
            allow_blank: true

  # todo: add uniquness on skill_id user_id and known

  belongs_to :user
  belongs_to :skill

  accepts_nested_attributes_for :skill

end
