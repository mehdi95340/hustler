Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:new, :create]
  resources :budgets do
    resources :expenses, only: [:new, :create, :index]
  end

  resources :expenses, only: [:show, :destroy, :edit, :update]

  resources :categories

  get 'dashboard', to: 'pages#dashboard'
  get 'allexpenses', to: 'expenses#all_expenses'
  get 'categories/:category_id/expenses', to: 'expenses#category_expenses'
  get 'budgets/:id/track', to: 'budgets#track'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
    root to: "pages#home"
  # Defines the root path route ("/")
  # root "posts#index"
  get "actions", to: "pages#actions", as: :actions
end
