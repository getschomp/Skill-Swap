class Skill < ActiveRecord::Base
  validates :name,
            presence: true,
            uniqueness: true,
            length: { maximum: 100 }

  has_many :user_skills

  has_many :users, through: :user_skills

  def get_users_wanted
    users = []
    # self calls the skill we are calling it on
    self.wanted_skills.each do |wanted_skill|
      unless wanted_skill.user.nil?
        users << wanted_skill.user
      end
    end
    users
  end

  def get_users_had
    users = []
    self.had_skills.each do |had_skill|
      unless had_skill.user.nil?
        users << had_skill.user
      end
    end
    users
  end

  def known

  end

  def self.search(query)
    where("name ILIKE ?", "%" + query + "%")
  end

end
