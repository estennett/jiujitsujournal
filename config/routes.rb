Rails.application.routes.draw do

  devise_for :users
  
  root to: 'entries#index'

  resources :entries do
    resources :techniques
  end

  resources :roadmaps
end
