class Conversation < ActiveRecord::Base
  validates :user_id_1,
            presence: true
  validates :user_id_2,
            presence: true

  add_index :converations, [:user_id_1, :user_id_2], unique: true

#pass in the id to the controller for the current user and the selected user.

end
