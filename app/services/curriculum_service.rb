class CurriculumService < IndicatorService
  class << self
    def primary
      eager_load(Indicators::Curriculum).first
    end

    def editable_by(teacher)
      eager_load(teacher.curricula)
    end

    def viewable_by(teacher)
      eager_load(Indicators::Curriculum).where('created_by_id in(?)', [1, teacher.id])
    end

    def find_indicator(indicator_id)
      eager_load(Indicator).find(indicator_id)
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
