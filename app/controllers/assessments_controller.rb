class AssessmentsController < ProtectedController
  before_filter :load_group

  def new
    @assessment = Assessment.new
  end

  def show
    @assessment = Assessment.find(params[:id])
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = Assessment.find(params[:id])

    if @assessment.update_attributes(assessment_params)
      redirect_to group_assessment_path(@group, @assessment), notice: 'Assessment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @assessment = Assessment.new(assessment_params)

    if @assessment.save
      redirect_to group_assessment_path(@group, @assessment), notice: 'Assessment was successfully created.'
    else
      render action: "new"
    end
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end

  def assessment_params
    params.require(:assessment).permit([:assessor_type, :assessor_id, :score,
      :indicator_id, :student_id, :name])
  end
end
