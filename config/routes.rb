Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  root "pets#index"

  resources :pets, only: [:index, :show, :new, :create, :destroy]

  resources :bookings, only: [:index, :create, :update, :destroy, :show, :new] do
    resources :reviews, only: [:new, :create, :show]
  end

  resources :reviews, only: [:destroy]

  get "dashboard", to: "dashboards#show"
end
