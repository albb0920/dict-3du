class AddSynonymsAndAntonymsToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :synonyms, :string
    add_column :definitions, :antonyms, :string
  end
end
