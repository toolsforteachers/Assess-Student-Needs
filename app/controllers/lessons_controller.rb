class LessonsController < ProtectedController
  before_filter :load_group

  def new
    @lesson = Lesson.new :group_id => @group.id
  end

  def show
    @lesson = Lesson.find(params[:id])
    @lesson_students = @lesson.lesson_students.order('students.name').includes(:student)
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update_attributes(params[:lesson])
      redirect_to group_lesson_path(@group, @lesson), notice: 'Lesson was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.teacher = current_teacher

    if @lesson.save
      redirect_to group_lesson_path(@group, @lesson), notice: 'Lesson was successfully created.'
    else
      render action: "new"
    end
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end
end