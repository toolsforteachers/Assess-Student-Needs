Acn::Application.routes.draw do

  devise_for :teachers do
    resources :groups
  end

  root to: 'groups#index'
end