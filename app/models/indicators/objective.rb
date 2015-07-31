class Indicators::Objective < Indicator
  after_save :set_cached_ancestry_name

  def allowable_child_types
    []
  end

  def set_cached_ancestry_name
    ancestry_name =
      self_and_ancestors.reverse_order
        .select{ |i| !i.is_a?(Indicators::Prompt) }
        .map(&:name).join(' :: ')
    update_column(:cached_ancestry_name, ancestry_name)
  end
end
