class StudentsController < ProtectedController
  def index
    @students = Student.includes(:groups)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    if params[:lesson_id]
      @lesson = Lesson.find(params[:lesson_id])
      @student.lesson_id = @lesson.id if @lesson
      @student.use_lesson_id = true
      @student.groups << @lesson.group
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      if @student.lesson_id
        @lesson = Lesson.find(@student.lesson_id)
        @lesson.students << @student
        redirect_to group_lesson_path(@lesson.group, @lesson), notice: 'Student was successfully added.'
      else
        redirect_to students_path, notice: 'Student was successfully created.'
      end
    else
      render action: "new"
    end
  end
end
