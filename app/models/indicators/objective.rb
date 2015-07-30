class Indicators::Objective < Indicator

  def allowable_child_types
    []
  end

  def delimited_ancestry_names
    @ancestry_names ||=
      self_and_ancestors.reverse_order
        .select{ |i| !i.is_a?(Indicators::Prompt) }
        .map(&:name).join(" :: ")
  end
end
