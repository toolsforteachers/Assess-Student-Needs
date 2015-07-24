class ProtectedController < ApplicationController
  before_filter :authenticate_teacher!

  def load_group
    @group = current_teacher.groups.find(params[:group_id])
  end
end
