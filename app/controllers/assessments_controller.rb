class AssessmentsController < ProtectedController
  before_filter :load_group

  def update
    @assessment = Assessment.find(params[:id])
    updated = @assessment.update_attributes(assessment_params)

    respond_to do |format|
      format.html do
        if updated
          redirect_to group_assessment_path(@group, @assessment), notice: 'Assessment was successfully updated.'
        else
          render action: "edit"
        end
      end
      format.js
    end
  end

  def create
    @assessment = Assessment.new(assessment_params)
    created = @assessment.save

    respond_to do |format|
      format.html do
        if created
          redirect_to group_assessment_path(@group, @assessment), notice: 'Assessment was successfully created.'
        else
          render action: "new"
        end
      end
      format.js { render action: 'update' }
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
