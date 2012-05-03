class LessonStudentsController < ProtectedController
  def update
    @lesson_student = LessonStudent.find(params[:id])
    @lesson_student.update_attribute :score, params[:lesson_student][:score]

    respond_to do |format|
      format.html {  redirect_to lesson_path(@lesson_student.lesson), notice: 'Score was successfully saved.' }
      format.js
    end

  end
end
