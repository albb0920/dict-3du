class Definition < ActiveRecord::Base
  belongs_to :heteronym
  belongs_to :see_entry
  attr_accessible :def, :example, :type
end
