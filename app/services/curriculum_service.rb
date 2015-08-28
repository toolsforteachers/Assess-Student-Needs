class CurriculumService
  class << self
    def primary
      eager_load(Indicators::Curriculum).first
    end

    def editable_by(teacher)
      eager_load(teacher.curricula)
    end

    def viewable_by(teacher)
      (editable_by(teacher) << primary).uniq
    end

    private

    def eager_load(obj)
      obj.includes(:self_and_descendants)
    end
  end
end
