class IndicatorsController < ProtectedController
  def index
    @subjects = Indicators::Subject.all
  end

  def show
    @indicator = Indicator.find(params[:id])
  end

  def new
    @indicator ||= Indicators::Subject.new
    render action: 'new'
  end

  def create
    if @indicator.save
      redirect_to @indicator, notice: "#{ @indicator.friendly_type } was successfully created."
    else
      render action: 'new'
    end
  end

  def edit
    @indicator = Indicator.find(params[:id])
  end
end
