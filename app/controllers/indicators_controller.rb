class IndicatorsController < ProtectedController
  def index
    @subjects = current_teacher_subjects
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

  def update
    @indicator = Indicator.find(params[:id])

    if @indicator.update_attributes(permitted_params)
      redirect_to @indicator, notice: "#{ @indicator.friendly_type } was successfully updated."
    else
      render action: 'edit'
    end
  end

  def destroy
    @indicator = Indicator.find(params[:id])
    indicator_parent = @indicator.parent
    msg = "#{ @indicator } was successfully deleted."
    if @indicator.destroy
      redirect_to (indicator_parent || indicators_path), notice: msg
    else
      redirect_to @indicator
    end
  end
end
