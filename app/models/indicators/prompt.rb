class Indicators::Prompt < Indicator

  def allowable_child_types
    [:prompt, :objective]
  end
end
