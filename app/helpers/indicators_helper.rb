module IndicatorsHelper
  def link_to_indicator(indicator)
    link_to indicator.name, indicator_path(indicator)
  end
end
