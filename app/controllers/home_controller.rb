class HomeController < ActionController::Base
  layout 'application'

  def show
    redirect_to groups_path if current_teacher
  end
end
