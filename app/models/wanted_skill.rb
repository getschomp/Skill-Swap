class WantedSkill < ActiveRecord::Base
  validates :skill_id,
  null: false
  validates :user_id,
  null: false

  belongs_to :user
  belongs_to :skill
end
