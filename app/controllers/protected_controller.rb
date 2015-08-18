class ProtectedController < ApplicationController
  before_filter :authenticate_teacher!

  def load_group
    @group = current_teacher.groups.find(params[:group_id])
  end

  helper_method :current_teacher_subjects

  def current_teacher_subjects
    Curriculum.first.subjects
  end
end
