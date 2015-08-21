class DiscussionsController < ProtectedController
  def show
    @indicator = Indicator.includes(:self_and_descendants).find_by(slug: params[:indicator_id])
    @subject = Indicators::Subject.where(id: @indicator.subject).includes(levels: [:topics]).first
  end
end
