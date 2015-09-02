class CurriculumService < IndicatorService
  class << self
    def primary
      Indicators::Curriculum.first
    end

    def editable_by(teacher)
      teacher.curricula
    end

    def viewable_by(teacher)
      Indicators::Curriculum.where('created_by_id in (?)',
        [primary.created_by_id, teacher.id])
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
