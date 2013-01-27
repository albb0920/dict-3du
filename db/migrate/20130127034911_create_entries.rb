class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :radical
      t.integer :stroke_count
      t.integer :non_radical_stroke_count
      t.references :dict

      t.timestamps
    end
    add_index :entries, :dict_id
  end
end
