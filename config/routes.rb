Rails.application.routes.draw do
  root 'users#welcome'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/auth/:provider/callback' => 'sessions#omniauth' 
  get '/sessions/homepage' => 'sessions#homepage'
  post '/sessions/social_media' => 'sessions#social_media'
  
  resources :users, except: [:index] 
  resources :sessions

  resources :patients, only: [:index, :new, :create, :edit]  
  resources :prescriptions, only: [:index, :new, :create, :edit]
  resources :medications, only: [:index, :new, :create, :edit]

  resources :pharmacies do
    resources :patients, shallow: true   
    resources :prescriptions, shallow: true 
    resources :medications, shallow: true 
  end

  
   
   
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
