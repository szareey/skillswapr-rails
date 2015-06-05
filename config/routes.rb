Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    collection {get :autocomplete}
    resources :teachables, :learnables, only: [:create, :destroy]
  end

  # For admin access
  get 'users/:id/dashboard' => 'users#dashboard_admin'

  root 'users#dashboard'
end
