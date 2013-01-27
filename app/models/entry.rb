class Entry < ActiveRecord::Base
  belongs_to :dict
  has_many :heteronyms
  attr_accessible :non_radical_stroke_count, :radical, :stroke_count, :title, :dict_id
end
