class ObjectivesController < ProtectedController
  before_filter :load_group
  before_filter :load_lesson
  before_filter :load_curricula, only: [:new]

  def new
    @objective = scoped_objectives.new(stream: "Stream #{ scoped_objectives.length + 1 }")
  end

  def create
    @objective = scoped_objectives.new(objective_params)
    @objective.save!
    redirect_to group_lesson_path(@group, @lesson), notice: 'Objective was successfully added'
  end

  protected

  def load_lesson
    @lesson = @group.lessons.find_by(slug: params[:lesson_id])
  end

  def load_curricula
    @curricula = CurriculumService.viewable_by(current_teacher)
  end

  def objective_params
    params.require(:objective).permit([:stream, :indicator_id])
  end

  def scoped_objectives
    @lesson.objectives
  end
end
