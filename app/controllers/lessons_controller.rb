class LessonsController < ApplicationController
  def index
    @lessons = current_teacher.lessons
  end

  def new
    @lesson = current_teacher.lessons.new
  end

  def show
    @lesson = current_teacher.lessons.find(params[:id])
  end

  def create
    @lesson = Lesson.new(params[:lesson], teacher: current_teacher)
    if @lesson.save
      redirect_to lesson_path(@lesson), notice: 'Lesson was successfully created.'
    else
      render action: "new"
    end
  end
end
