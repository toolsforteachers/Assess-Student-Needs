class CurriculaController < ProtectedController
  def index
    @curricula = CurriculumService.viewable_by(current_teacher)
  end
end
