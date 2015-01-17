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

    def sort_by_intersection(had_skill, wanted_skill)

    end

    def sort_alphabetically

    end

    def sort_by_intersection_nearest

    end

    def sort_by_nearest

    end
end
