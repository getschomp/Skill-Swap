class Location < ActiveRecord::Base

    has_many :users, through: :user_location
end
