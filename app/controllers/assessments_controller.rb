class AssessmentsController < ProtectedController
  before_filter :load_group

  def update
    @assessment = Assessment.find(params[:id])
    @assessment.update_attributes!(assessment_params)
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end

  def assessment_params
    params.require(:assessment).permit([:mark, :out_of, :notes])
  end
end
