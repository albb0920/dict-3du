class Heteronym < ActiveRecord::Base
  belongs_to :word
  attr_accessible :bopomofo, :bopomofo2, :pinyin
end
