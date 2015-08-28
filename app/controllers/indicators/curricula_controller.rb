class Indicators::CurriculaController < IndicatorsController
  def new
    @indicator = Indicators::Curriculum.new
    super
  end

  def create
    @indicator = Indicators::Curriculum.new(permitted_params)
    @indicator.created_by = current_teacher
    super
  end

  protected

  def permitted_params
    params.require(:indicators_curriculum).permit([:name])
  end
end
