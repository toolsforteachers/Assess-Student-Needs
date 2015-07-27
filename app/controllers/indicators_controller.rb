class IndicatorsController < ProtectedController
  def index
    @subject = Indicators::Subject.last
  end
end
