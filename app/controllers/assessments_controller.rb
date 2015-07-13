class AssessmentsController < ProtectedController
  before_filter :load_group

  def new
    @assessment = Assessment.new :group_id => @group.id, type_helper: params[:type_helper]
  end

  def show
    @assessment = Assessment.find(params[:id])
    @assessment_students = @assessment.assessment_students.order('students.name').includes(:student => [:assessment_students => [:assessment]])
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
    @assessment = Assessment.new(assessment_params)
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

  def assessment_params
    params.require(:assessment).permit(:type_helper, :group_id, :notes, :level, :key, :indicator_id)
  end
end
