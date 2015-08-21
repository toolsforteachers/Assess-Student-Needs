class DiscussionsController < ProtectedController
  def show
    @indicator = Indicator.includes(:children).find_by(slug: params[:indicator_id])
    @subject = Indicators::Subject.where(id: @indicator.subject).includes(levels: [:topics]).first
    @topics = @indicator.topics
  end
end
