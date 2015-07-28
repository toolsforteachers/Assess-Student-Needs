class Indicators::SubjectsController < IndicatorsController
  def new
    @indicator = Indicators::Subject.new
    super
  end

  def create
    @indicator = Indicators::Subject.new(indicator_params)
    super
  end

  protected

  def indicator_params
    params.require(:indicators_subject).permit([:name])
  end
end
