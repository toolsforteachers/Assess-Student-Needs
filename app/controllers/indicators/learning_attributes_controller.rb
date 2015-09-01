class Indicators::LearningAttributesController < IndicatorsController
  def new
    @indicator = Indicators::LearningAttribute.new(parent: @parent)
    super
  end

  def create
    @indicator = Indicators::LearningAttribute.new(permitted_params)
    super
  end

  protected

  def permitted_params
    params.require(:indicators_learning_attribute).permit([:name, :parent_id])
  end
end
