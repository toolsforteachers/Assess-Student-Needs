class Indicators::PedagogiesController < IndicatorsController
  def new
    @indicator = Indicators::Pedagogy.new
    super
  end

  def create
    @indicator = Indicators::Pedagogy.new(permitted_params)
    @indicator.created_by = current_teacher
    super
  end

  protected

  def permitted_params
    params.require(:indicators_pedagogy).permit([:name])
  end
end
