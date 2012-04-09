Acn::Application.routes.draw do

  devise_for :teachers

  devise_scope :teacher do
    resources :groups do
      resources :students
    end
  end

  root to: 'welcome#show'
end