class WantedSkill < ActiveRecord::Base
  validates :skill_id,
  null: false
  validates :user_id,
  null: false

  belongs_to :user
  belongs_to :skill

  # def skill_id
  #   skill.id if skill
  # end
  #
  # def skill_id_from_name(name)
  #   self.skill.id = Skill.find_by(name:name).id
  # end

  def skill_name
    skill.name if skill
  end

  def skill_name=(name)
    self.skill = Skill.find_or_create_by(name:name) unless name.blank?
  end

end
