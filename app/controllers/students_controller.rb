class StudentsController < ProtectedController
  def index
    @students = Student.all
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
    @level = (params[:level] || @student.current_level).to_i
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :prior_knowledge_level, group_ids: [])
  end
end
