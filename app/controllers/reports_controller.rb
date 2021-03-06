class ReportsController < ProtectedController
  before_filter :load_group
  before_filter :load_lesson

  def lesson
  end

  def objective
    @objective = Objective.find_by(id: params[:objective_id])
    respond_to do |format|
      format.pdf do
        render pdf: "report", layout: 'pdf.html.haml'
      end
    end
  end

  def student_notes
    assessments = @lesson.assessments
      .includes(:student)
      .order('students.name')
      .select{ |assessment| assessment.notes.present? }


    Prawn::Labels.types = {

      "Avery7165" => {
        "paper_size" => "A4",
        "columns"    => 2,
        "rows"       => 4,
        "top_margin" => 38,
        "bottom_margin" => 38,
        "left_margin" => 38,
        "right_margin" => 38,
        "columns" => 2,
        "rows" => 4,
        "column_gutter" => 38,
        'row_gutter' => 28

    }}

    file = Prawn::Labels.render(assessments, :type => "Avery7165") do |pdf, assessment|

      pdf.font("Helvetica")
      pdf.font_size 10

      pdf.text "#{ assessment.student.name },"
      pdf.text assessment.notes

      #
      # pdf.move_down 15
      # pdf.text "Date: #{ assessment.updated_at }"
      # pdf.text "Teacher: #{ assessment.assessed_by.try(:name) }"
    end

    send_data file,
      filename: "student-notes-#{ @lesson.slug }.pdf",
      type: 'application/pdf'
  end

  protected

  def load_lesson
    @lesson = @group.lessons.find(params[:lesson_id])
  end
end
