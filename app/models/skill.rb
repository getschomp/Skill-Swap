class Skill < ActiveRecord::Base
  validates :name,
    presence: true
    # max length

  validates :category,
    presence: true
    # max length

  has_many :users, through: :user_skills
end
