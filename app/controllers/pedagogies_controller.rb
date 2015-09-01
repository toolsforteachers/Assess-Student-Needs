class PedagogiesController < ProtectedController
  def index
    @pedagogies = PedagogyService.viewable_by(current_teacher)
  end
end
