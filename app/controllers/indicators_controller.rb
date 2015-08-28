class IndicatorsController < ProtectedController
  before_filter :load_scoped_curricula

  def show
    @indicator = Indicator.find(params[:id])
  end

  def new
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

  protected

  def load_scoped_curricula
    @scoped_curricula = CurriculumService.editable_by(current_teacher)
  end
end
