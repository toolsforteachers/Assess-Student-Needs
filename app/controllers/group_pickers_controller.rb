class GroupPickersController < ProtectedController
  before_action :load_curriculum

  protected

  def load_curriculum
    @curriculum = CurriculumService.find_indicator(params[:curriculum_id])
  end
end
