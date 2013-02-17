class Definition < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :def, :example, :type, :source, :synonyms, :antonyms, :heteronym_id

  has_comma_splited_fields :synonyms, :antonyms

  belongs_to :heteronym
  belongs_to :link, polymorphic: true
end
