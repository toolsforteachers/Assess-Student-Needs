class CurriculaController < ProtectedController
  def index
    @curricula = CurriculumService.viewable_by(current_teacher)
  end

  def show
    @topic = CurriculumService.first_topic(params[:id])
    @subject = CurriculumService.find_indicator(@topic.subject) if @topic
  end
end
