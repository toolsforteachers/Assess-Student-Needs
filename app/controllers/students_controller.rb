class StudentsController < ProtectedController
  before_action :load_group

  def show
    @student = @group.students.find(params[:id])
  end

  def index
    @students = @group.students
  end
end
