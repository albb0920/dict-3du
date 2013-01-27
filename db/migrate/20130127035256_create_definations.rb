class CreateDefinations < ActiveRecord::Migration
  def change
    create_table :definations do |t|
      t.references :heteronym
      t.integer :type
      t.string :def
      t.string :example
      t.references :see_entry

      t.timestamps
    end
    add_index :definations, :heteronym_id
    add_index :definations, :see_entry_id
  end
end
