class LessonsController < ApplicationController
  before_filter :load_group

  def new
    @lesson = Lesson.new simple_lesson_date: Date.today
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update_attributes(lesson_params)
      redirect_to group_assessment_path(@group, @lesson), notice: 'Lesson was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.group = @group

    if @lesson.save
      redirect_to group_assessment_path(@group, @lesson), notice: 'Lesson was successfully created.'
    else
      render action: "new"
    end
  end

  def index
  end

  protected
  def load_group
    @group = Group.find(params[:group_id])
  end

  def lesson_params
    params.require(:lesson).permit([:name, :notes, :level,
      :key, :simple_lesson_date, :indicator_id])
  end
end
