class Objective < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :indicator

  validates :indicator_id, presence: :true
  validates :stream, length: { maximum: 15 }, presence: true

  default_scope { order('stream') }

  delegate :topic, to: :indicator
  delegate :level, to: :indicator
  delegate :objective, to: :indicator
end
