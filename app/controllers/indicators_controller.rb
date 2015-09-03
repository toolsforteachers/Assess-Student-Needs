class IndicatorsController < ProtectedController
  before_filter :load_indicator, only: [:show, :edit, :update, :destroy]
  before_filter :load_parent, only: [:new, :create]

  def show
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
  end

  def update
    if @indicator.update_attributes(permitted_params)
      redirect_to @indicator, notice: "#{ @indicator.friendly_type } was successfully updated."
    else
      render action: 'edit'
    end
  end

  def destroy
    indicator_parent = @indicator.parent
    msg = "#{ @indicator } was successfully deleted."
    if @indicator.destroy
      redirect_to (indicator_parent || '/'), notice: msg
    else
      redirect_to @indicator
    end
  end

  def index
    @curricula = CurriculumService.editable_by(current_teacher)
  end

  protected

  def load_indicator
    @indicator = CurriculumService.find_indicator(params[:id])
    disallowed! unless IndicatorService.can_edit_indicator?(current_teacher, @indicator)
  end

  def load_parent
    if params[:parent_id]
      @parent = CurriculumService.find_indicator(params[:parent_id])
      disallowed! unless IndicatorService.can_edit_indicator?(current_teacher, @parent)
    end
  end
end
