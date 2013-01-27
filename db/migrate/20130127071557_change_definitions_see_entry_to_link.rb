class ChangeDefinitionsSeeEntryToLink < ActiveRecord::Migration
  def up
    remove_column :definitions, :see_entry_id
    add_column :definitions, :link_type, :string
    add_column :definitions, :link_id, :integer
  end

  def down
  end
end
