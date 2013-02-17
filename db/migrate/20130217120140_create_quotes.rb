class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :source
      t.string :content
      t.integer :definition_id

      t.timestamps
    end
  end
end
