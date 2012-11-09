class AssessmentStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :assessment

  def lesson?
    assessment.is_a?(Lesson)
  end
end
