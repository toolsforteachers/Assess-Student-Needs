class IndicatorService
  class << self
    def can_edit_indicator?(teacher, indicator)
      indicator.root.created_by == teacher
    end

    def find_indicator(indicator_id)
      eager_load(Indicator).find(indicator_id)
    end

    protected

    def eager_load(obj)
      obj.includes(:self_and_descendants)
    end
  end
end
