class IndicatorsController < ProtectedController
  def index
    @indicators = Indicator.scoped
    @indicators = @indicators.where(:level => params[:level]) if params[:level]
    @indicators = @indicators.where(:key => params[:key]) if params[:key]
  end
end