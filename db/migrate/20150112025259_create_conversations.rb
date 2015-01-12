class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_id_1, null: false
      t.integer :user_id_2, null: false
    end
    add_index :conversations, [:user_id_1, :user_id_2], unique: true
    
  end
end
