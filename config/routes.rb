Acn::Application.routes.draw do
  devise_for :teachers

  resources :groups do
    resources :assessments
    resources :lessons
    resources :students
  end

  root to: 'home#show'
end
