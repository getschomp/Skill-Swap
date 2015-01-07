class Skill < ActiveRecord::Base
  validates :name,
    presence: true
    # max length

  validates :category,
    presence: true
    # max length
  has_many :user_skills
  has_many :users, through: :user_skills

  def get_categories
    ["technology", "art", "fitness", "hiking"]
  end
end
