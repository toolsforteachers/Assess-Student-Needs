module AssessmentsHelper
  def lesson?
    @assessment && @assessment.type_helper == 'Lesson'
  end

  def assessment_display_type_name
    lesson? ? "Lesson#{ ' : ' + (@assessment.name || '') }" : 'Teacher Judgement'
  end
end
