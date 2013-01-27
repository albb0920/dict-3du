class ChangeDefinitionsTypeColumn < ActiveRecord::Migration
  def up
    change_column :definitions, :type, :string
  end

  def down
    change_column :definitions, :type, :integer
  end
end
