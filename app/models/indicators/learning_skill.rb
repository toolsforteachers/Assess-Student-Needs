class Indicators::LearningSkill < Indicator
  def allowable_child_types
    [:objective]
  end

  def friendly_type
    'Learning skill'
  end
end
