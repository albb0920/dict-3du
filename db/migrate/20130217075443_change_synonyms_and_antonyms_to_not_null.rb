class ChangeSynonymsAndAntonymsToNotNull < ActiveRecord::Migration
  def up
    change_column :definitions, :synonyms, :string, null: false, default: ''
    change_column :definitions, :antonyms, :string, null: false, default:''
  end

  def down
    change_column :definitions, :synonyms, :string
    change_column :definitions, :antonyms, :string
  end
end
