class Message < ActiveRecord::Base
  validates :content,
            presence: true
  validates :user_id,
            presence: true
  validates :conversation_id,
            precence: true


end
