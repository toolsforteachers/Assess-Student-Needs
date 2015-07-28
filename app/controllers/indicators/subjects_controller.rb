class Indicators::SubjectsController < IndicatorsController
  def new
    @indicator = Indicators::Subject.new
    super
  end

  def create
    @indicator = Indicators::Subject.new(subject_params)
    if @indicator.save
      redirect_to indicators_path, notice: "#{ @indicator.friendly_type } was successfully created."
    else
      render action: 'edit'
    end
  end

  protected

  def subject_params
    params.require(:indicators_subject).permit([:name])
  end
end
