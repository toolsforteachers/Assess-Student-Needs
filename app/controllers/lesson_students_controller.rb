class LessonStudentsController < ProtectedController
  def update
    @lesson_student = LessonStudent.find(params[:id])
    @lesson_student.score = params[:lesson_student][:score]
    @lesson_student.notes = params[:lesson_student][:notes]
    @lesson_student.save

    respond_to do |format|
      format.html {  redirect_to group_lesson_path(@lesson_student.lesson.group, @lesson_student.lesson), notice: 'Score was successfully saved.' }
      format.js
    end

  end
end
