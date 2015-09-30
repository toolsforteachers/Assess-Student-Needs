class ReportsController < ProtectedController
  before_filter :load_group
  before_filter :load_lesson

  def lesson
  end

  def student_notes
    names = @lesson.assessments
      .includes(:student)
      .order('students.name')
      .select{ |assessment| assessment.notes.present? }
      .map{ |assessment| "#{ assessment.student }, #{ assessment.notes }"}

    labels = Prawn::Labels.render([], :type => "Avery5160") do |pdf, name|
      pdf.text name
    end

    send_data labels,
      filename: "student-notes-#{ @lesson.slug }.pdf",
      type: 'application/pdf'
  end

  protected

  def load_lesson
    @lesson = @group.lessons.find(params[:lesson_id])
  end
end
