class Indicators::Topic < Indicator
  def topics
    [self]
  end

  def allowable_child_types
    [:prompt, :objective]
  end
end
