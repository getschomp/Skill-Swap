class CreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :about_me, :text
    change_column_null :users, :username, false
    add_index :users, :username, unique: true
  end
end
