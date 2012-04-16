class StudentsController < ProtectedController
  before_filter :load_group

  def index
    @students = @group.students
  end

  def new
    @student = @group.students.new lesson_id: params[:lesson_id]
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      @group.students << @student
      if @student.lesson_id.present?
        @lesson = Lesson.find(@student.lesson_id)
        @lesson.students << @student
        redirect_to lesson_path(@lesson), notice: 'Student was successfully added.'
      else
        redirect_to group_students_path(@group), notice: 'Student was successfully created.'
      end
    else
      render action: "new"
    end
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end
end
