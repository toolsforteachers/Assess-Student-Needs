class DiscussionsController < ProtectedController
  def show
    @indicator = Indicator.find_by(slug: params[:indicator_id])
    @subject = @indicator.ancestry.where(type: 'Indicators::Subject').first
  end
end
