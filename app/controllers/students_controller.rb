class StudentsController < ProtectedController
  def index
    @students = Student.includes(:groups)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
    @level = (params[:level] || @student.current_level).to_i
  end

  def new
    @student = Student.new
    if params[:lesson_id]
      @assessment = Lesson.find(params[:lesson_id])
      @student.lesson_id = @assessment.id if @assessment
      @student.use_lesson_id = true
      @student.groups << @assessment.group
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: 'Student was successfully created.'
    else
      render action: "new"
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :prior_knowledge_level, group_ids: [])
  end
end
