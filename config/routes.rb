Rails.application.routes.draw do
  resources :managers
  resources :pharmacies
   
  resources :medications do
    resources :patients, only: [:index, :show]
  end
  resources :patients

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
