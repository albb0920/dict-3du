class Entry < ActiveRecord::Base
  belongs_to :dict
  has_many :heteronyms
  attr_accessible :non_radical_stroke_count, :radical, :stroke_count, :title, :dict_id

  def as_json(options={})
    options.merge!(
      except: [:created_at, :updated_at, :dict_id],
      include: {
        heteronyms: {
          include: {
            definitions: {
              except: [:created_at, :updated_at]
            }
          },
          except: [:created_at, :updated_at]}
      }
    )
    super(options)
  end

  def self.index
    select('title').collect(&:title)
  end
end
