Acn::Application.routes.draw do
  devise_for :teachers

  resources :groups do
   resources :students
  end
  resources :lessons, :lesson_students

  root to: 'lessons#index'
end