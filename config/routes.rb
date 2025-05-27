Rails.application.routes.draw do
  get 'emergency_topics/show'
  get 'emergency_topics/new'
  get 'emergency_topics/edit'
  get 'emergency_modules/index'
  get 'emergency_modules/show'
  get 'emergency_modules/new'
  get 'emergency_modules/edit'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
