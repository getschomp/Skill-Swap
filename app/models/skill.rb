class Skill < ActiveRecord::Base
  validates :name,
    presence: true,
    uniqueness: true
    # max length

  validates :category,
    presence: true
    # max length
  has_many :wanted_skills
  has_many :had_skills
  has_many :users, through: :wanted_skills
  has_many :users, through: :had_skills
  has_many :categories


  def get_categories
    ["technology", "art", "fitness", "hiking"]
  end

  def get_users_wanted
    users = []
    self.wanted_skills.each do |wanted_skill|
      users << wanted_skill.user.username
    end
    users
  end

  def get_users_had
    users = []
    self.had_skills.each do |had_skill|
      users << had_skill.user.username
    end
    users
  end



end
