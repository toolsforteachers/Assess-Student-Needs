class AssessmentStudentsController < ProtectedController
  def update
    @assessment_student = AssessmentStudent.find(params[:id])
    @assessment_student.score = params[:assessment_student][:score]
    @assessment_student.notes = params[:assessment_student][:notes]
    @assessment_student.save

    respond_to do |format|
      format.html {  redirect_to group_assessment_path(@assessment_student.assessment.group, @assessment_student.assessment), notice: 'Score was successfully saved.' }
      format.js
    end

  end
end
