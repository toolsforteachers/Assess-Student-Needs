class LessonStudentsController < ProtectedController
  def update
    @lesson_student = LessonStudent.find(params[:id])
    @lesson_student.update_attribute :score, params[:lesson_student][:score]
    redirect_to lesson_path(@lesson_student.lesson), notice: 'Score was successfully saved.'
  end
end
