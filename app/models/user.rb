class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            presence: true,
            uniqueness: true

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  has_many :conversations, foreign_key: :sender_id

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
