class ReportsController < ApplicationController
  before_filter :load_group

  def lesson
    @lesson = @group.lessons.find(params[:lesson_id])
  end
end
