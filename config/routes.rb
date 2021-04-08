Rails.application.routes.draw do
  root 'users#welcome'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  resources :users, except: [:index, :show]
  resources :pharmacies do
    resources :patients, only: [:index, :show]
    resources :prescriptions, only: [:index, :show]
    resources :medications, only: [:index, :show]
  end

  resources :patients, except: [:index, :show]
  resources :prescriptions, except: [:index, :show]
  resources :medications, except: [:index, :show]
   
   
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
