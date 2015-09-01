class PedagogiesController < ProtectedController
  def index
    @pedagogies = PedagogyService.viewable_by(current_teacher)
  end

  def show
    @learning_skill = PedagogyService.first_skill(params[:id])
    @learning_attribute = @learning_skill.learning_attribute
    @pedagogy = @learning_skill.pedagogy

    @section_header = @learning_attribute || @learning_skill
  end
end
