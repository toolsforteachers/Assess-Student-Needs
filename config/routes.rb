Acn::Application.routes.draw do
  devise_for :teachers

  resources :groups do
    resources :assessments
    resources :lessons do
      resource :report, action: :lesson
    end
    resources :students
  end

  resources :indicators
  resources :indicators_subjects, controller: :indicators
  root to: 'home#show'
end
