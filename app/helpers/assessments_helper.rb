module AssessmentsHelper
  def lesson?
    @assessment && @assessment.type_helper == 'Lesson'
  end

  def assessment_display_type_name
    lesson? ? lesson_name : 'teacher judgement'
  end

  def lesson_name
    s = "lesson"
    s += " ; #{ @assessment.name }" if @assessment.name
    s
  end
end
