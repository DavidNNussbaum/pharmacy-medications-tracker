Rails.application.routes.draw do
  root 'users#welcome'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/auth/facebook/callback' => 'sessions#create' 
  get '/auth/google/callback' => 'sessions#create' 
  # get '/auth/:provider/callback' => 'sessions#omniauth' 
  
  resources :users, except: [:index] 
  resources :sessions

  resources :patients, only: [:index, :new, :create]  
  resources :prescriptions, only: [:index, :new, :create]
  resources :medications, only: [:index, :new, :create]

  resources :pharmacies do
    resources :patients, shallow: true   
    resources :prescriptions, shallow: true 
    resources :medications, shallow: true 
  end

  
   
   
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
