class ReportsController < ProtectedController
  before_filter :load_group
  before_filter :load_lesson

  def lesson
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
        "left_margin" => 26,
        "right_margin" => 26,
        "columns" => 2,
        "rows" => 4,
        "column_gutter" => 18,
        'row_gutter' => 0

    }}

    file = Prawn::Labels.render(assessments, :type => "Avery7165") do |pdf, assessment|

      pdf.font_size 12
      pdf.font("Helvetica", :style => :bold)

      pdf.text "#{ assessment.student.name },"
      pdf.font("Helvetica")
      pdf.text assessment.notes

      pdf.font_size 10

      pdf.stroke do
        pdf.move_down 15
        pdf.dash(5, space: 2, phase: 0)
        pdf.line_width 1
        pdf.stroke_horizontal_rule
        pdf.move_down 10
      end
      pdf.text "Date: #{ assessment.updated_at }"
      pdf.text "Teacher: #{ assessment.assessed_by.try(:name) }"
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
