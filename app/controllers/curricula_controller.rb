class CurriculaController < ProtectedController
  def index
    @curricula = current_teacher.curricula.includes(subjects: [:levels])
  end
end
