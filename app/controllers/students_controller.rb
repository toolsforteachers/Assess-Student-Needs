class StudentsController < ApplicationController
  before_filter :load_group

  def index
    @students = @group.students
  end

  def new
    @student = @group.students.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      @group.students << @student
      redirect_to group_students_path(@group), notice: 'Student was successfully created.'
    else
      render action: "new"
    end
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end
end
