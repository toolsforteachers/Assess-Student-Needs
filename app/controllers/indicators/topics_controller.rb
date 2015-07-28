class Indicators::TopicsController < IndicatorsController
  def new
    @indicator = Indicators::Topic.new(parent_id: params[:parent_id])
    super
  end

  def create
    @indicator = Indicators::Topic.new(topic_params)
    super
  end

  protected

  def topic_params
    params.require(:indicators_topic).permit([:name, :parent_id])
  end
end
