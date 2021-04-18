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
---------------------------------------
<h1>Medication Status in <%= @pharmacy.name %></h1>
<div>
  <% @pharmacy.prescriptions.medications.order.each do |med| %>
    <%= med.name %>
    <%= med.prescriptions.current_total %>

  <% end %>
</div>
--------------------------------------------
<div class="third-party-login">
          <%= label_tag :code %><br>
          <%= text_field_tag :code %><br>
          <%= f.submit :login %>
          <% end %>
          -------------------------------------------------------
          <%= form_for(@medication) do |f| %>

            <label>Medication Name-Strength:</label><br>
            <%= f.collection_check_boxes :name, Medication.all, :id, :name %><br>
              <%= f.label :name, "Create A New Medication-Strength:" %><br>
              <%= f.text_field :name %><br>
              <%= f.label :quantity_dispensed, "Enter The Quantity Dispensed:" %><br>
              <%= f.text_field :quantity_dispensed %><br>
              <%= f.label :quantity_dispensed, "Enter The Quantity Received:" %><br>
              <%= f.text_field :quantity_received %><br>
          
              <%= f.fields_for :pharmacies do |pharm| %>
              <%= pharm.collection_check_boxes :name, Pharmacy.all, :id, :name %><br>
              <%= pharm.label :name, "Enter A New Pharmacy Name:" %><br>
              <%= pharm.text_field :name %><br>
              <%= pharm.label :name, "Enter A New Pharmacy Address:" %><br>
              <%= pharm.text_field :address %><br>
           
          
          <%= f.fields_for :patients do |pat| %>
              <%= pat.collection_check_boxes :name, Patient.all, :id, :name %><br>
              <%= pat.label :first_name, "Enter A New Patient First Name:" %><br>
              <%= pat.text_field :first_name %><br>
              <%= pat.label :last_name, "Enter A New Patient Last Name:" %><br>
              <%= pat.text_field :last_name %><br>
              <%= pat.label :dob, "Enter A New Patient Date of Birth (mm/dd/yyyy):" %><br>
              <%= pat.text_field :dob %><br>
              <%= pat.label :address, "Enter A New Patient Address:" %><br>
              <%= pat.text_field :address %><br>
          <% end %>
          <% end %>
            
              <%= f.submit "Enter the Medication"%>
            <% end %> 
            ----------------------------------------------------
            <%= link_to 'Press to Continue', sessions_homepage_path %>
            -------------------------------------------------------
            Medication.create( name: "atorvastatin-20", quantity_dispensed:20, quantity_received: 100, pharmacy_id: 2)

            
            
 













GOOGLE_CLIENT_ID: 'ENTER YOUR CODE HERE'
GOOGLE_CLIENT_SECRET: 'ENTER YOUR CODE HERE'
FACEBOOK_CLIENT_ID: 'ENTER YOUR CODE HERE'
FACEBOOK_CLIENT_SECRET: 'ENTER YOUR CODE HERE'
---------------------------------------------------
&.strftime("%m/%d/%Y")