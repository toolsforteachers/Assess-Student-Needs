class Indicators::LearningAttribute < Indicator
  def allowable_child_types
    [:learning_skill]
  end

  def friendly_type
    'Learning attribute'
  end
end
