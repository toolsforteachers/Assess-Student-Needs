class PedagogiesController < ProtectedController
  def index
    @pedagogies = PedagogyService.viewable_by(current_teacher)
  end

  def show
    @learning_skill = PedagogyService.first_skill(params[:id])
    @pedagogy = @learning_skill.pedagogy
  end
end
