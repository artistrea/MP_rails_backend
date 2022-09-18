# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
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
    patch '/update', to: 'products#update'
    get '/index', to: 'products#index'
    get '/show', to: 'products#show'
    delete '/delete', to: 'products#delete'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
