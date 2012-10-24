Acn::Application.routes.draw do
  devise_for :teachers

  resources :groups do
   resources :lessons
  end
  resources :students, :lesson_students, :indicators

  root to: 'home#show'
end