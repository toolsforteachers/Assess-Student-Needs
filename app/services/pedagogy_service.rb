class PedagogyService < IndicatorService
  class << self
    def editable_by(teacher)
      eager_load(teacher.pedagogies)
    end

    def viewable_by(teacher)
      Indicators::Pedagogy.all
    end

    def first_topic(indicator_id)
      indicator = find_indicator(indicator_id)
      if indicator.is_a?(Indicators::Topic)
        indicator
      elsif indicator.is_a?(Indicators::Level)
        indicator.topics.try(:first)
      else
        nil
      end
    end
  end
end
