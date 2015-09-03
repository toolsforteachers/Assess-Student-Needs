class LessonPickersController < ProtectedController
  before_action :load_objective_and_group

  def create
    lesson = @group.lessons.new(
        group: @group, lesson_date: Date.today, teacher: current_teacher)
    lesson.objectives.build(indicator: @objective, stream: 'Stream 1')
    lesson.save
    redirect_to [@group, lesson], notice: 'Lesson was successfully created'
  end

  protected

  def load_objective_and_group
    @objective = IndicatorService.find_indicator(params[:objective_id])
    @group = current_teacher.groups.find(params[:group_picker_id])
  end
end
