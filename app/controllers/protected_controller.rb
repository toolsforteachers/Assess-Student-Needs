class ProtectedController < ApplicationController
  before_filter :authenticate_teacher!

  def load_group
    @group = current_teacher.groups.includes(:students).find(params[:group_id])
  end

  def disallowed!
    render text: 'You are not allowed to do that!'
  end
end
