class ProgressController < ProtectedController
  before_filter :load_group

  def show
    @student = Student.find_by(slug: params[:student_id])
    @indicator = Indicator.find_by(slug: params[:id])
    @indicators = @indicator.leaves.where(type: 'Indicators::Objective')
      .sort_by{ |i| [i.topic, i.objective ] }
  end
end
