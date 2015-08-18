class Indicators::Subject < Indicator
  belongs_to :curriculum

  validates :name, uniqueness: { scope: :curriculum_id }
  validates :curriculum_id, presence: true

  default_scope { order('name') }

  def levels
    @levels = descendants.where(type: 'Indicators::Level')
  end

  def allowable_child_types
    [:level, :topic]
  end
end
