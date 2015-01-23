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

  has_many :conversations, :foreign_key => :sender_id

  accepts_nested_attributes_for :wanted_skills
  accepts_nested_attributes_for :had_skills

  geocoded_by :address
  after_validation :geocode

  def self.search(query)
   where("username ILIKE ?", "%" + query + "%")
  end

  def self.find_by_distance(miles, users, current_user)
    nearby_users = []
    users.each do |user|
      distance = user.distance_to(current_user.address)
      if distance <= miles
        nearby_users << user
      end
    end
    nearby_users
  end

end
