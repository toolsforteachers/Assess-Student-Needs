class LessonsController < ProtectedController
  def index
    @lessons = current_teacher.lessons
  end

  def new
    @lesson = current_teacher.lessons.new
  end

  def show
    @lesson = current_teacher.lessons.find(params[:id])
  end

  def edit
    @lesson = current_teacher.lessons.find(params[:id])
  end

  def update
    @lesson = current_teacher.lessons.find(params[:id])

    if @lesson.update_attributes(params[:lesson])
      redirect_to lesson_path(@lesson), notice: 'Lesson was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.teacher = current_teacher
    if @lesson.save
      redirect_to lesson_path(@lesson), notice: 'Lesson was successfully created.'
    else
      render action: "new"
    end
  end
end
