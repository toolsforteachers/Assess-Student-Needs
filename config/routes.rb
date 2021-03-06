Acn::Application.routes.draw do
  devise_for :teachers, controllers: { registrations: 'registrations' }

  resources :groups do
    resources :assessments
    resources :lessons do
      resource :report, action: :lesson
      resource :student_notes, controller: :reports, action: :student_notes
      resources :objectives do
        resource :report, action: :objective
      end
      resources :teaching_materials
    end
    resources :students do
      resources :progress, only: [:show]
    end
  end

  resources :curricula
  resources :pedagogies

  resources :objectives, only: [:new, :edit] do
    resources :group_pickers, only: [:index] do
      resources :lesson_pickers, only: [:create]
    end
  end

  resources :indicators
  resources :indicators_curricula, controller: 'indicators/curricula'
  resources :indicators_subjects, controller: 'indicators/subjects'
  resources :indicators_levels, controller: 'indicators/levels'
  resources :indicators_topics, controller: 'indicators/topics'
  resources :indicators_prompts, controller: 'indicators/prompts'
  resources :indicators_objectives, controller: 'indicators/objectives'

  resources :indicators_pedagogies, controller: 'indicators/pedagogies'
  resources :indicators_learning_attributes, controller: 'indicators/learning_attributes'
  resources :indicators_learning_skills, controller: 'indicators/learning_skills'

  namespace :api do
    namespace :v1 do
      resources :rating_scales, only: [:index, :show]
    end
  end

  root to: 'home#show'
end
