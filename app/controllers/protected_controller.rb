class ProtectedController < ApplicationController
  before_filter :authenticate_teacher!

  def load_group
    @group = current_teacher.groups.find(params[:group_id])
  end

  def ensure_admin!
    render text: "You are not allowed here!" and return unless current_teacher.admin?
  end

  def disallowed!
    render text: 'You are not allowed to do that!'
  end
end
