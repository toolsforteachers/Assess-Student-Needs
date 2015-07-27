class IndicatorsController < ProtectedController

  def index
    @indicators = Indicator.all
  end
end
