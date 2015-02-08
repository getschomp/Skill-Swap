class DropTableSearchSuggestions < ActiveRecord::Migration

  def up
    drop_table :search_suggestions
  end

  def down
    create_table :search_suggestions
  end

end
