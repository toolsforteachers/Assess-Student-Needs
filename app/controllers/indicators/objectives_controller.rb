class Indicators::ObjectivesController < IndicatorsController
  def new
    @indicator = Indicators::Objective.new(parent_id: params[:parent_id])
    super
  end

  def create
    @indicator = Indicators::Objective.new(level_params)
    super
  end

  protected

  def level_params
    params.require(:indicators_objective).permit([:name, :parent_id])
  end
end
