class Heteronym < ActiveRecord::Base
  belongs_to :entry
  has_many :definitions, dependent: :destroy
  attr_accessible :bopomofo, :bopomofo2, :pinyin, :entry_id

  def as_json(options={})
    super(options.merge!({
        methods: [:definitions],
        except: [:created_at, :updated_at]}))
  end
end
