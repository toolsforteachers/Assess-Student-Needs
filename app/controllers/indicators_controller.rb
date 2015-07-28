class IndicatorsController < ProtectedController
  def index
    redirect_to indicator_path(Indicators::Subject.first)
  end

  def show
    @indicator = Indicator.find(params[:id])
  end
end
