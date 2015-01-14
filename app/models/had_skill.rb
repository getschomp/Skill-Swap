class HadSkill < ActiveRecord::Base
  validates :skill_id,
    null: false
  validates :user_id,
    null: false
  validates :expertise_level,
    inclusion: { in: %w(None Novice Intermediate Expert)}

  belongs_to :user
  belongs_to :skill

  def get_users(skill)
    users = []
    skill.had_skills.each do |had_skill|
      users << had_skill.user.username
    end
    users
  end
  #research collect
end
