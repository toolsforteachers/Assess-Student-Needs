module AssessmentsHelper
  def lesson?
    @assessment && @assessment.type_helper == 'Lesson'
  end

  def assessment_display_type_name
    lesson? ? "Lesson#{ ' : ' + @assessment.name unless @assessment.new_record? }" : 'Teacher Judgement'
  end
end
