Acn::Application.routes.draw do
  devise_for :teachers

  resources :groups do
   resources :students
  end
  resources :lessons

  root to: 'lessons#index'
end