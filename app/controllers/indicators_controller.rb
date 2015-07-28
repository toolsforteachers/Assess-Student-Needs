class IndicatorsController < ProtectedController
  def index
    @subjects = Indicators::Subject.all
  end

  def show
    @indicator = Indicator.find(params[:id])
  end

  def new
    render action: 'new'
  end

  def create
    if @indicator.save
      redirect_to @indicator, notice: "#{ @indicator.friendly_type } was successfully created."
    else
      render action: 'edit'
    end
  end
end
