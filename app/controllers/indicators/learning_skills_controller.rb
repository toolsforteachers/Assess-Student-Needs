class Indicators::LearningSkillsController < IndicatorsController
  def new
    @indicator = Indicators::LearningSkill.new(parent: @parent)
    super
  end

  def create
    @indicator = Indicators::LearningSkill.new(permitted_params)
    super
  end

  protected

  def permitted_params
    params.require(:indicators_learning_skill).permit([:name, :parent_id])
  end
end
