class IndicatorsController < ProtectedController
  def index
    @subjects = Indicators::Subject.all
  end

  def show
    @indicator = Indicator.find(params[:id])
  end

  def new
    @indicator = Indicators::Subject.new
  end
end
