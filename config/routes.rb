Acn::Application.routes.draw do
  devise_for :teachers, controllers: { registrations: 'registrations' }

  resources :groups do
    resources :assessments
    resources :lessons do
      resource :report, action: :lesson
      resources :objectives
      resources :teaching_materials
    end
    resources :students do
      resources :progress, only: [:show]
    end
  end

  resources :curricula
  resources :indicators, only: [:new, :edit]
  resources :indicators_curricula, controller: 'indicators/curricula'
  resources :indicators_subjects, controller: 'indicators/subjects'
  resources :indicators_levels, controller: 'indicators/levels'
  resources :indicators_topics, controller: 'indicators/topics'
  resources :indicators_prompts, controller: 'indicators/prompts'
  resources :indicators_objectives, controller: 'indicators/objectives'

  resources :discussions, only: [:show]

  root to: 'home#show'
end
