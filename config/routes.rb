Acn::Application.routes.draw do
  devise_for :teachers

  resources :groups do
   resources :assessments
  end
  resources :students, :assessment_students, :indicators

  root to: 'home#show'
end