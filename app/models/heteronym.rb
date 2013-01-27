class Heteronym < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :bopomofo, :bopomofo2, :pinyin, :entry_id
end
