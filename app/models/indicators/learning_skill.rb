class Indicators::LearningSkill < Indicator
  def allowable_child_types
    [:objective]
  end
end
