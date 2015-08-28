class DiscussionsController < ProtectedController
  def show
    @topic = CurriculumService.first_topic(params[:id])
    @subject = CurriculumService.find_indicator(@topic.subject) if @topic
  end
end
