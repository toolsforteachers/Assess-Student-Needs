class PedagogyService < IndicatorService
  class << self
    def editable_by(teacher)
      eager_load(teacher.pedagogies)
    end

    def viewable_by(teacher)
      Indicators::Pedagogy.all
    end

    def first_skill(indicator_id)
      indicator = find_indicator(indicator_id)
      if indicator.is_a?(Indicators::LearningSkill)
        indicator
      elsif indicator.is_a?(Indicators::LearningAttribute)
        indicator.learning_skills.try(:first)
      else
        nil
      end
    end
  end
end
