module StudentsHelper
  def i(indicator_key)
    Indicator.where(level: @level).where(key: indicator_key).order(:position).all.map do |indicator|
      render partial: 'app_score', locals: { indicator: indicator }
    end.join("<br/>").html_safe
  end
end
