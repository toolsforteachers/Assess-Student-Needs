class Indicators::Subject < Indicator
  validates :name, uniqueness: true

  default_scope { order('name') }

  def allowable_child_types
    [:level, :topic]
  end
end
