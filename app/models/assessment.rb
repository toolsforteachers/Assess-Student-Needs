class Assessment < ActiveRecord::Base
  belongs_to :assessor, polymorphic: true
  belongs_to :indicator
  belongs_to :student

  default_scope { includes(:student).order('students.name') }

  scope :by_indicator, ->(indicator) { where(indicator: indicator) }
  scope :by_student, ->(student) { where(student: student) }

  def attempts_at(obj_indicator)
    related_attempts = Assessment.by_student(student).by_indicator(obj_indicator)
    related_attempts.flatten - [self]
  end

  def stream
    return unless persisted?
    return unless alt_streams?
    assessor.objective.try(:stream)
  end

  def alt_streams?
    assessor.multiple_objectives?
  end
end
