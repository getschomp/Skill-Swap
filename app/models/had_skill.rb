class HadSkill < ActiveRecord::Base
  validates :skill_id,
    null: false
  validates :user_id,
    null: false
  validates :expertise_level,
    inclusion: { in: %w(None Novice Intermediate Expert)}

  belongs_to :user
  belongs_to :skill

end
