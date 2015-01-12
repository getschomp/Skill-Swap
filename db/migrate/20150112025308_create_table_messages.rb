class CreateTableMessages < ActiveRecord::Migration
  def change
    create_table :table_messages do |t|

      t.timestamps
    end
  end
end
