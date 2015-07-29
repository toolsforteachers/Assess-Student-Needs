class Indicators::SubjectsController < IndicatorsController
  def new
    @indicator = Indicators::Subject.new
    super
  end

  def create
    @indicator = Indicators::Subject.new(subject_params)
    super
  end

  protected

  def subject_params
    params.require(:indicators_subject).permit([:name])
  end
end
