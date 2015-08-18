class Indicators::SubjectsController < IndicatorsController
  def new
    @indicator = Indicators::Subject.new(curriculum_id: params[:curriculum_id])
    super
  end

  def create
    @indicator = Indicators::Subject.new(permitted_params)
    super
  end

  protected

  def permitted_params
    params.require(:indicators_subject).permit([:name, :curriculum_id])
  end
end
