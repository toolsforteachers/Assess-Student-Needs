class CurriculaController < ProtectedController
  def show
    @curriculum = Curriculum.find_by(slug: params[:id])
  end
end
