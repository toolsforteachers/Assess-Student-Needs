class StudentsController < ProtectedController
  before_action :load_group

  def show
    @student = @group.students.find(params[:id])
    @level = (params[:level] || @student.current_level).to_i
  end
end
