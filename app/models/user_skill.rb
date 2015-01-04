class UserSkill < ActiveRecord::Base
  validates :skill_id,
    null: false
  validates :user_id,
    null: false
  validates :have_or_want,
    null: false,
    inclusion: { in: %w(have want)}
  validates :expertise_level,
    null: false,
    inclusion: { in: %w(None Novice Intermediate Expert)}

  belongs_to :user
  belongs_to :skill
end
