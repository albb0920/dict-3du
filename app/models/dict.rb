class Dict < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :entries, dependent: :destroy
  self.inheritance_column = nil

  TYPE_CHAR_DICT   = 0
  TYPE_PHRASE_DICT = 1
  TYPE_IDIOM_DICT  = 2

  def type_string
    (self.type == TYPE_IDIOM_DICT)? 'idiom': 'dict'
  end
end
