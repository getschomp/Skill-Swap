class UserSkill < ActiveRecord::Base
  validate :skill_id,
    null: false
  validate :user_id,
    null: false
  validate :have_or_want,
    null: false,
    inclusion: { in: %w(have want)}
  validate :expertise_level,
    null: false,
    inclusion: { in: %w(beginner intermidiate expert)}

  belongs_to :user
  belongs_to :skill
end
