class AddIdxToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :idx, :integer
  end
end
