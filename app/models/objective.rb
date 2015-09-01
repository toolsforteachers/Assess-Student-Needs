class Objective < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :indicator

  validates :indicator_id, presence: :true
  validates :stream, length: { maximum: 15 }, presence: true

  default_scope { order('stream') }

  delegate :curriculum, to: :indicator
  delegate :subject, to: :indicator
  delegate :topic, to: :indicator
  delegate :level, to: :indicator
  delegate :objective, to: :indicator
  delegate :pedagogy, to: :indicator
  delegate :learning_attribute, to: :indicator
  delegate :learning_skill, to: :indicator
end
