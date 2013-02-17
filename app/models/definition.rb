class Definition < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :def, :example, :type, :source, :synonyms, :antonyms, :heteronym_id, :idx

  has_comma_splited_fields :synonyms, :antonyms
  has_many :quotes

  belongs_to :heteronym
  belongs_to :link, polymorphic: true

  default_scope order('idx ASC')

  def as_json(options={})
    super(options.merge!({
      methods: [:quotes],
      except: [:created_at, :updated_at]
    }))
  end
end
