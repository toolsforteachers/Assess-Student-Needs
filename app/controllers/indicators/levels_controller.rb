class Indicators::LevelsController < IndicatorsController
  def new
    @indicator = Indicators::Level.new(parent_id: params[:parent_id])
    super
  end

  def create
    @indicator = Indicators::Level.new(level_params)
    super
  end

  protected

  def level_params
    params.require(:indicators_level).permit([:name, :parent_id])
  end
end
