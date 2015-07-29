class Indicators::StrandsController < IndicatorsController
  def new
    @indicator = Indicators::Strand.new(parent_id: params[:parent_id])
    super
  end

  def create
    @indicator = Indicators::Strand.new(permitted_params)
    super
  end

  protected

  def permitted_params
    params.require(:indicators_strand).permit([:name, :parent_id])
  end
end
