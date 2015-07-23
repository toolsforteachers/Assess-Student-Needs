Acn::Application.routes.draw do
  devise_for :teachers

  resources :groups do
   resources :assessments
   resources :lessons
   resources :students
   resources :teacher_judgements, controller: :assessments
  end
  resources :assessment_students, :indicators

  root to: 'home#show'
end
