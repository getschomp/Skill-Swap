class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            presence: true,
            uniqueness: true

  has_many :had_skills, dependent: :destroy
  has_many :wanted_skills, dependent: :destroy
  has_many :skills, through: :wanted_skills
  has_many :skills, through: :had_skills
  has_one :location
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :wanted_skills, :update_only => true
  accepts_nested_attributes_for :had_skills, :update_only => true

  # def sort_by_intersection(had_skill_id, wanted_skill_id)
  #   matching_had_skill = []
  #   had_skills = HadSkill.all
  #   had_skills.each do |had_skill|
  #     if had_skill.id == had_skill_user_id
  #       matching_had_skill << HadSkill.find_by(user_id: had_skill.user_id)
  #     end
  #   end
  #
  # end
  #
  # def sort_by_intersection(had_skill_id, wanted_skill_id)
  #   match = []
  #   users = User.all
  #   users.each do |user|
  #     user.had_skills.each do |had_skill|
  #       user.wanted_skills.each do |wanted_skill|
  #         if had_skill.id == had_skill_id && wanted_skill.id == wanted_skill_id
  #           match << user
  #         end
  #       end
  #     end
  #   end

  def sort_by_intersection(had_skill_id, wanted_skill_id)
    match = []

    # find all users where had_skill_id matches and wanted_skill_id
    # and wanted_skill_id mathes had skill id
      HadSkill.where(skill_id: had_skill.id)
  end

  def sort_alphabetically

  end

  def sort_by_intersection_nearest

  end

  def sort_by_nearest

  end
end
