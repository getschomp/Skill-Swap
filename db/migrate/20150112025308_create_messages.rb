class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :conversation_id, null: false

      t.timestamps
    end
  end
end
