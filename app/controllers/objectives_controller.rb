class ObjectivesController < ProtectedController
  before_filter :load_group
  before_filter :load_lesson
  before_filter :load_subject, only: [:new]

  def new
    @objective = scoped_objectives.new(stream: 'Stream 1')
  end

  def create
    @objective = scoped_objectives.new(objective_params)
    if @objective.save
      redirect_to group_lesson_path(@group, @lesson), notice: 'Objective was successfully added'
    else
      redirect_to group_lesson_path(@group, @lesson), error: 'The objective could not be added'
    end
  end

  protected

  def load_lesson
    @lesson = @group.lessons.find_by(slug: params[:lesson_id])
  end

  def load_subject
    @subject = Indicators::Subject.find_by(id: @lesson.subject_id)
  end

  def objective_params
    params.require(:objective).permit([:stream, :indicator_id])
  end

  def scoped_objectives
    @lesson.objectives
  end
end
