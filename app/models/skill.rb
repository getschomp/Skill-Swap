class Skill < ActiveRecord::Base
  validates :name,
            presence: true,
            uniqueness: true,
            length: { maximum: 100 }

  has_many :user_skills
  has_many :users, through: :user_skills

  has_many :known_skills, -> { where(known?: true) }, class_name: 'UserSkill'
  has_many :users_that_know, through: :known_skills, source: :user

  has_many :wanted_skills, -> { where(known?: false) }, class_name: 'UserSkill'
  has_many :users_that_want, through: :wanted_skills, source: :user

  def self.search(query)
    where("name ILIKE ?", "%" + query + "%")
  end

end
