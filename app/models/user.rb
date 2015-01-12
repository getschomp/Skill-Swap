class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    presence: true,
    uniqueness: true

    has_many :had_skills
    has_many :wanted_skills
    has_one :location, through: :user_location
    accepts_nested_attributes_for :location
end
