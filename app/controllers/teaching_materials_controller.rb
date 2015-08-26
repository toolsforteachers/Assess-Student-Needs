class TeachingMaterialsController < ProtectedController
  before_filter :load_group
  before_filter :load_lesson

  def create
    @teaching_material = TeachingMaterial.create(teaching_material_params)
    @lesson.teaching_materials << @teaching_material
    redirect_to group_lesson_path(@group, @lesson), notice: 'Teaching Material was successfully added'
  end

  protected

  def load_lesson
    @lesson = @group.lessons.find_by(slug: params[:lesson_id])
  end

  def teaching_material_params
    params.require(:teaching_material).permit(:file)
  end
end
