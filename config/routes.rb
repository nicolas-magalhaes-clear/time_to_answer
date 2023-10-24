Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  devise_for :users
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'search_subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end  
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
  devise_for :admins, :skip => [:registration]
  get 'welcome/index'
  get 'backoffice', to: 'admins_backoffice/welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'site/welcome#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
