class Objective < ActiveRecord::Base
  belongs_to :lesson, touch: true
  belongs_to :indicator

  validates :indicator_id, presence: :true

  delegate :curriculum, to: :indicator
  delegate :subject, to: :indicator
  delegate :topic, to: :indicator
  delegate :level, to: :indicator
  delegate :objective, to: :indicator
  delegate :pedagogy, to: :indicator
  delegate :learning_attribute, to: :indicator
  delegate :learning_skill, to: :indicator

  def type_of
    return 'Curriculum objective' if curriculum
    return 'Pedagogy objective' if pedagogy
  end

  def heading
    return subject if curriculum
    return learning_skill if pedagogy
  end
end
