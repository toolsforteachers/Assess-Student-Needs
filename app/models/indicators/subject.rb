class Indicators::Subject < Indicator
  validates :name, uniqueness: true

  default_scope { order('name') }

  def allowable_child_types
    [:level, :topic]
  end

  def objectives
    leaves.where(type: 'Indicators::Objective')
      .sort{|a,b| a.cached_ancestry_name <=> b.cached_ancestry_name}
  end
end
