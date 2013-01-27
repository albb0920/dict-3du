class ChangeHeteronymsWordIdToEntryId < ActiveRecord::Migration
  def change
    rename_column :heteronyms, :word_id, :entry_id
  end
end
