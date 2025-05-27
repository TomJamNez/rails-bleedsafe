Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :training_modules, only: [:index, :show, :new, :create, :edit, :update] do
    resources :training_topics, only: [:show, :new, :create, :edit, :update] do
      resources :training_progress, only: [:create, :update] do
          member do
          patch 'in-progress'
          patch 'completed'
          end
	    end
      resources :training_pages, only: [:create,  :update]
      end
  end

resources :emergency_modules, only: [:index, :show, :new, :create, :edit, :update] do
    resources :emergency_topics, only: [:show, :new, :create, :edit, :update] do
        resources :emergency_pages, only: [:create,  :update]
      end
  end



end
