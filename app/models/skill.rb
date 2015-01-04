class Skill < ActiveRecord::Base
  validate :name,
    presence: true
    # max length

  validate :category,
    presence: true
    # max length

  has_many :users, through: user_skills
end
