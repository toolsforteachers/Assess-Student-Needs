class Indicators::LearningSkill < Indicator
  has_many :objectives, -> { order (:name) }, class_name: 'Indicators::Objective', foreign_key: :parent_id

  def allowable_child_types
    [:objective]
  end

  def friendly_type
    'Learning skill'
  end
end
