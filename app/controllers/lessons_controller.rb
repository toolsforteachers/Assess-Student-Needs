class LessonsController < ProtectedController
  before_filter :load_group

  def new
    @lesson = @group.lessons.new lesson_date: Date.today
  end

  def edit
    @lesson = scoped_lessons.find(params[:id])
  end

  def show
    @lesson = scoped_lessons.find(params[:id])
  end

  def update
    @lesson = scoped_lessons.find(params[:id])

    if @lesson.update_attributes(lesson_params)
      redirect_to group_lesson_path(@group, @lesson), notice: 'Lesson was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @lesson = scoped_lessons.new(lesson_params)

    if @lesson.save
      redirect_to new_group_lesson_objective_path(@group, @lesson),
        notice: 'Lesson was successfully created. Now select an objective.'
    else
      @lesson.objectives.build if @lesson.objectives.empty?
      render action: "new"
    end
  end

  def index
  end

  protected

  def lesson_params
    params.require(:lesson).permit([[:lesson_date, :notes, :teacher_id, :subject_id],
      objectives_attributes: [:id, :stream, :indicator_id, :_destroy]])
  end

  def scoped_lessons
    @group.lessons
  end
end
