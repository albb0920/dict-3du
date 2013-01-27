class CreateDicts < ActiveRecord::Migration
  def change
    create_table :dicts do |t|
      t.string :name
      t.integer :type

      t.timestamps
    end
  end
end
