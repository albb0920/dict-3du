class CreateHeteronyms < ActiveRecord::Migration
  def change
    create_table :heteronyms do |t|
      t.references :word
      t.string :bopomofo
      t.string :bopomofo2
      t.string :pinyin

      t.timestamps
    end
    add_index :heteronyms, :word_id
  end
end
