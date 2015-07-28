class Indicators::Level < Indicator

  def allowable_child_types
    [:topic, :prompt, :objective]
  end
end
