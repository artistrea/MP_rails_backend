# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all
  
  # For staff to login, admin to edit staff
  scope "users" do
    post '/create', to: 'users#create'
    get '/index', to: 'users#index'
    post '/login', to: 'users#login'
    delete '/delete/:id', to: 'users#delete'
  end

  # For admin to manage tables and its numbers
  scope "tables" do
    post '/create', to: 'tables#create'
    get '/index', to: 'tables#index'
    delete '/delete/:id', to: 'tables#delete'
  end

  # For staff to manage clients using tables.
  scope "clients" do
    post '/create', to: 'clients#create'
    get '/index', to: 'clients#index'
    get '/bill', to: 'clients#bill' # Still not made
  end

  scope "products" do
    post '/create', to: 'products#create'
    patch '/update/:id', to: 'products#update'
    get '/index', to: 'products#index'
    get '/show/:id', to: 'products#show'
    delete '/delete/:id', to: 'products#delete'
  end

  scope "orders" do
    get '/index', to: 'orders#index'
    get '/show/:id', to: 'orders#show'
    patch '/update/:id', to: 'orders#update'
    delete '/delete/:id', to: 'orders#delete'
    post '/create', to: 'orders#create'
    get '/index_consult/:status', to: 'orders#index_consult'
  end

  scope "contact_us" do
    get '/index', to: 'contact_us#index'
    post '/create', to: 'contact_us#create'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
