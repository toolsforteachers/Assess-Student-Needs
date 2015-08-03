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
  resources :indicators_subjects, controller: 'indicators/subjects'
  resources :indicators_levels, controller: 'indicators/levels'
  resources :indicators_topics, controller: 'indicators/topics'
  resources :indicators_strands, controller: 'indicators/strands'
  resources :indicators_prompts, controller: 'indicators/prompts'
  resources :indicators_objectives, controller: 'indicators/objectives'

  root to: 'home#show'
end
