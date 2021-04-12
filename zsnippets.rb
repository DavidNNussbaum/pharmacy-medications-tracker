#-------------------------------------------------
Rails.application.routes.draw do
    get 'users/new'
    get 'users/create'
    get 'users/show'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
    get 'auth/:provider/callback', to: 'sessions#omniauth'
    get '/users/reset_password', to: 'users#reset_form'
    post '/users/reset_password', to: 'users#password_reset'
    get '/signup', to: 'users#new'
    post '/users', to: 'users#create'
    get '/login', to: "sessions#new"
    post '/login', to: "sessions#create"
    get '/logout', to: "sessions#destroy"
  
    # get '/products', to: 'products#index'
    # get '/products/:id', to: 'products#show', as: 'product'
    # get '/products/new', to: 'products#new'
    # post '/products', to: 'products#create'
  
    #shortcut route generator syntax
    resources :products, only: [:index, :new, :create]
    resources :users, only: [:index, :show]
    resources :brands do
      resources :products, shallow: true
    end
  end
  -----------------------------------------------------------------------
  <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>

  ----------------------------------------------------------------------
  <%= f.fields_for :pharmacies do |pharm| %>
    <%= pharm.collection_check_boxes :pharmacy_id, Pharmacy.all, :id, :name %><br>
    <%= pharm.fields_for :pharmacy, @pharmacy.build_pharmacy do |pharmacies_fields| %>
    <%= pharmacies_fields.label :name, "Enter A New Pharmacy Name:" %><br>
    <%= pharmacies_fields.text_field :name %><br>
<% end %>
  <%= f.fields_for :patients do |pat| %>
    <%= pat.collection_check_boxes :patient_id, Patient.all, :id, :name %><br>
    <%= pat.fields_for :patient, @patient.build_patient do |patients_fields| %>
    <%= patients_fields.label :name, "Enter A New Patient Name:" %><br>
    <%= patients_fields.text_field :name %><br>
    <%= patients_fields.label :name, "Enter The New Patient's Age:" %><br>
    <%= patients_fields.text_field :age %><br>
<% end %>
  
 <% end %>

 -------------------------------------------------------------
 <%= f.fields_for :medication, @medication.build_medication do |medications_fields| %>
  -----------------------------------------------------------------------
  <%= f.fields_for :pharmacies do |pharm| %>
    <%= pharm.collection_check_boxes :name, Pharmacy.all, :id, :name %><br>
    <%= pharm.label :name, "Enter A New Pharmacy Name:" %><br>
    <%= pharm.text_field :name %><br>
    <%= pharm.label :name, "Enter A New Pharmacy Address:" %><br>
    <%= pharm.text_field :address %><br>
<% end %> 
-----------------------------------------------
<%= link_to 'Logout', session_path(current_user), method: :delete %>
<%= button_to "Logout", session_path, method: :delete %>
---------------------------------------------------------------
prescription = Prescription.new(prescription_params)
binding.pry
if prescription.save
else
end

prescription.valid?
prescription.errors.full_messages



<% end %>
 