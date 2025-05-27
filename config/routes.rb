Rails.application.routes.draw do
  get 'training_topics/show'
  get 'training_topics/new'
  get 'training_topics/edit'
  get 'training_modules/index'
  get 'training_modules/show'
  get 'training_modules/new'
  get 'training_modules/edit'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
