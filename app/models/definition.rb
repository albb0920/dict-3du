class Definition < ActiveRecord::Base
  belongs_to :heteronym
  belongs_to :link, polymorphic: true
  attr_accessible :def, :example, :type, :source, :synonyms, :antonyms, :heteronym_id
  self.inheritance_column = nil
end
