class Quote < ActiveRecord::Base
  attr_accessible :content, :definition_id, :source
  belongs_to :definition

  def as_json(options={})
    super(options.merge!(except: [:created_at, :updated_at, :definition_id]))
  end
end
