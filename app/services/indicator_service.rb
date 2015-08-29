class IndicatorService
  class << self
    def can_edit_indicator?(teacher, indicator)
      indicator.root.created_by == teacher
    end
  end
end
