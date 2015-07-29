class Indicators::PromptsController < IndicatorsController
  def new
    @indicator = Indicators::Prompt.new(parent_id: params[:parent_id])
    super
  end

  def create
    @indicator = Indicators::Prompt.new(permitted_params)
    super
  end

  protected

  def permitted_params
    params.require(:indicators_prompt).permit([:name, :parent_id])
  end
end
