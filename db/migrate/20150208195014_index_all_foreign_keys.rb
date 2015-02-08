class IndexAllForeignKeys < ActiveRecord::Migration
  def change
    # conversations already has indexes on sender_id and recipient_id
    add_index :messages, :user_id
    add_index :messages, :conversation_id
    add_index :user_skills, :user_id
    add_index :user_skills, :skill_id
  end
end
