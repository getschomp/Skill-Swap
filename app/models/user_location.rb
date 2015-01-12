class UserLocation < ActiveRecord::Base
  validates :user_id,
    null: false
  validates :location_id,
    null: false
  belongs_to :user
  belongs_to :location
end
