class Indicators::Topic < Indicator

  def allowable_child_types
    [:strand, :prompt, :objective]
  end
end
