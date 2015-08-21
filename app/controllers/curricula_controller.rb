class CurriculaController < ProtectedController
  def index
    @curricula = current_teacher.curricula
  end
end
