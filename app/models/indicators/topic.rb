class Indicators::Topic < Indicator
  def topics
    [self]
  end

  def allowable_child_types
    [:strand, :prompt, :objective]
  end
end
