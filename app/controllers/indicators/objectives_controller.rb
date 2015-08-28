class Indicators::ObjectivesController < IndicatorsController
  def new
    @indicator = Indicators::Objective.new(parent: @parent)
    super
  end

  def create
    @indicator = Indicators::Objective.new(permitted_params)
    super
  end

  protected

  def permitted_params
    params.require(:indicators_objective).permit([:name, :parent_id])
  end
end
