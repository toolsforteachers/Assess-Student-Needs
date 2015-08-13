class ProgressController < ProtectedController
  before_filter :load_group

  def show
    @student = Student.find_by(slug: params[:student_id])
    @indicator = Indicator.find_by(id: params[:id])
  end
end
