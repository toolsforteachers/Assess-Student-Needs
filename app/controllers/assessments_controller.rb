class AssessmentsController < ProtectedController
  before_filter :load_group

  def update
    @assessment = Assessment.find(params[:id])
    updated = @assessment.update_attributes(assessment_params)
    render_update
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end

  def assessment_params
    params.require(:assessment).permit([:assessor_type, :assessor_id, :mark, :out_of,
      :indicator_id, :student_id, :notes])
  end

  def render_update
    respond_to do |format|
      format.js { render action: 'update' }
    end
  end
end
