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

  def get_categories
    ["technology", "art", "fitness", "hiking"]
  end
end
