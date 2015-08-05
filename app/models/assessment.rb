class Assessment < ActiveRecord::Base
  belongs_to :assessor, polymorphic: true
  belongs_to :indicator
  belongs_to :student

  default_scope { includes(:student).order('students.name') }

  scope :by_indicator, ->(indicator) { where(indicator: indicator) }
  scope :by_student, ->(student) { where(student: student) }

  def previous_attempts_by(student, indicators)
    previous_attempts = []
    indicators.each do |indicator|
      attempt = Assessment.by_student(student).by_indicator(indicator)
      previous_attempts << attempt
    end
    previous_attempts.flatten - [self]
  end
end
