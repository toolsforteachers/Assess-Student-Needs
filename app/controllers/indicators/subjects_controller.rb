class Indicators::SubjectsController < IndicatorsController
  def new
    @indicator = Indicators::Subject.new(parent: @parent)
    super
  end

  def create
    @indicator = Indicators::Subject.new(permitted_params)
    super
  end

  protected

  def permitted_params
    params.require(:indicators_subject).permit([:name, :parent_id])
  end
end
