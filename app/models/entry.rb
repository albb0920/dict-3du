class Entry < ActiveRecord::Base
  belongs_to :dict
  attr_accessible :non_radical_stroke_count, :radical, :stroke_count, :title
end
