class AddSourceToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :source, :string
  end
end
