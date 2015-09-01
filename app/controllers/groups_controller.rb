class GroupsController < ProtectedController
  # GET /groups
  # GET /groups.json
  def index
    @groups = scoped_groups.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    redirect_to group_lessons_path(params[:id])
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = scoped_groups.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = scoped_groups.find(params[:id])
    (5 - @group.students.length).times do
      @group.students.build
    end

  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to group_path(@group), notice: 'Class was successfully created.'

    else
      render action: "new"
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = scoped_groups.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(group_params)
        format.html { redirect_to @group, notice: 'Class was successfully updated.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def scoped_groups
    current_teacher.groups
  end

  def group_params
    params.require(:group).permit([:name, :teacher_id, students_attributes: [:id, :name, :_destroy]])
  end
end
