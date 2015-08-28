class Curriculum
  class << self
    def primary
      Indicators::Curriculum.includes(subjects: [:levels]).first
    end

    def for(teacher)
      teacher.curricula
    end
  end
end
