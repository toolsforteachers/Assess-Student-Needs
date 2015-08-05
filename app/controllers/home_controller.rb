class HomeController < ActionController::Base
  def show
    if current_teacher
      redirect_to groups_path
    else
      render layout: 'application'
    end
  end
end
