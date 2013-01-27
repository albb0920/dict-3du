class RenameDefinationsToDefinitions < ActiveRecord::Migration
  def change
    rename_table :definations, :definitions
  end
end
