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
  has_many :conversations, :foreign_key => :sender_id
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :wanted_skills
  accepts_nested_attributes_for :had_skills
end
