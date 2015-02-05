class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  #TODO: validate the presence of the object / association instead of the foreign key
  validates_presence_of :body, :conversation_id, :user_id
end
