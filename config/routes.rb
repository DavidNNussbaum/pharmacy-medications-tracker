Rails.application.routes.draw do
  resources :pharmacies do
    resources :managers, only: [:index, :show]
  end
  resources :pharmacies do
    resources :medications, only: [:index, :show, :new, :create, :edit]
  end
  resources :medications
  resources :managers
  resources :pharmacies do
    resources :patients, only: [:index, :show]
  end
  resources :patients

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
