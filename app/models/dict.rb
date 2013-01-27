class Dict < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :entries
  self.inheritance_column = nil
end
