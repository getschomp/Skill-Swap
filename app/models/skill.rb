class Skill < ActiveRecord::Base
  validates :name,
            presence: true,
            uniqueness: true
    # max length

  has_many :wanted_skills
  has_many :had_skills
  has_many :users, through: :wanted_skills
  has_many :users, through: :had_skills
  has_many :categories

  def get_users_wanted
    users = []
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

  def self.search(query)
    where("name ILIKE ?", "%" + query + "%")
  end

end
