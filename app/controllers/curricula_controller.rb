class CurriculaController < ProtectedController
  def index
    @curricula = CurriculumService.viewable_by(current_teacher)
  end

  def show
    @topic = CurriculumService.first_topic(params[:id])
    @level = @topic.level
    @subject = @topic.subject
    @levels = @subject.levels
  end
end
