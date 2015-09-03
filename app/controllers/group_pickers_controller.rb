class GroupPickersController < ProtectedController
  before_action :load_objective

  protected

  def load_objective
    @objective = IndicatorService.find_indicator(params[:objective_id])
  end
end
