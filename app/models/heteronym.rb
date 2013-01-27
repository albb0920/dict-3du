class Heteronym < ActiveRecord::Base
  belongs_to :entry
  has_many :definitions
  attr_accessible :bopomofo, :bopomofo2, :pinyin, :entry_id
end
