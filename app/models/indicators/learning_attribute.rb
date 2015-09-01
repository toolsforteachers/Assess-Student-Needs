class Indicators::LearningAttribute < Indicator
  has_many :learning_skills, -> { order (:name) }, class_name: 'Indicators::LearningSkill', foreign_key: :parent_id

  def allowable_child_types
    [:learning_skill]
  end

  def friendly_type
    'Learning attribute'
  end
end
