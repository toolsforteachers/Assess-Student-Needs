class AssessmentsController < ProtectedController
  before_filter :load_group

  def new
    @assessment = Assessment.new :group_id => @group.id, type_helper: params[:type_helper]
  end

  def show
    @assessment = Assessment.find(params[:id])
    @assessment_students = @assessment.assessment_students.order('students.name').includes(:student)
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = Assessment.find(params[:id])
    if @assessment.update_attributes(params[:lesson] || params[:teacher_judgement])
      redirect_to group_assessment_path(@group, @assessment), notice: 'Assessment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @assessment = Assessment.new(params[:assessment])
    @assessment.teacher = current_teacher

    if @assessment.save
      redirect_to group_assessment_path(@group, @assessment), notice: 'Assessment was successfully created.'
    else
      render action: "new"
    end
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end
end