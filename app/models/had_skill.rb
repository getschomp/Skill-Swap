class HadSkill < ActiveRecord::Base
  validates :skill_id,
            null: false
  validates :user_id,
            null: false,
            uniqueness: { scope: :skill_id,
            message: "You can't add the same skill twice" }
  # validates :expertise_level,
  #           inclusion: { in: ["", "Beginner", "Intermediate", "Advanced", nil]}

  belongs_to :user
  belongs_to :skill

  accepts_nested_attributes_for :skill

  def find_matching_users
    users = []
    # TODO: at scale, this is a big problem. Do some reading on joins and
    #  identify how you can retrieve all users that have a wanted skill in common with me.
    WantedSkill.where(skill_id: skill_id).each do |wanted_skill|
      users << wanted_skill.user
    end
    users
  end

end
