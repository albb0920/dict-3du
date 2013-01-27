class Definition < ActiveRecord::Base
  belongs_to :heteronym
  attr_accessible :def, :example, :type
end
