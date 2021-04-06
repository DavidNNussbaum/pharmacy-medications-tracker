Rails.application.routes.draw do
  resources :managers
  resources :patients
  resources :pharmacies
  resources :medications
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
