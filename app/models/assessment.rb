class Assessment < ActiveRecord::Base
  belongs_to :assessor, polymorphic: true
  belongs_to :indicator
  belongs_to :student

  default_scope { includes(:student).order('students.name') }

  scope :by_indicator, ->(indicator) { where(indicator: indicator) }
  scope :by_student, ->(student) { where(student: student) }

  delegate :topic, to: :indicator
  delegate :level, to: :indicator
  delegate :objective, to: :indicator

  delegate :assessed_at, to: :assessor
  delegate :assessed_by, to: :assessor

  def attempts_at(obj_indicator)
    related_attempts = Assessment.by_student(student).by_indicator(obj_indicator)
    related_attempts.flatten - [self]
  end

  def score
    return 0 if mark.to_i == 0
    mark.to_f / out_of.to_f
  end
end
