class Assessment < ActiveRecord::Base
  belongs_to :assessor, polymorphic: true, touch: true
  belongs_to :indicator
  belongs_to :student

  scope :by_indicator, ->(indicator) { where(indicator: indicator) }
  scope :by_student, ->(student) { where(student: student) }
  scope :marked, -> { where('mark > 0') }

  delegate :topic, to: :indicator
  delegate :level, to: :indicator
  delegate :objective, to: :indicator

  delegate :assessed_at, to: :assessor
  delegate :assessed_by, to: :assessor

  def previous_attempts_at_indicator
    Assessment.by_student(self.student).by_indicator(self.indicator) - [self]
  end

  def score
    return 0 if mark.to_i == 0
    mark.to_f / out_of.to_f
  end
end
