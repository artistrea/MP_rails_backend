# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  scope "users" do
    post '/create', to: 'users#create'
    get '/index', to: 'users#index'
    post '/login', to: 'users#login'
    delete '/delete/:id', to: 'users#delete'
  end

  scope "tables" do
    post '/create', to: 'tables#create'
    get '/index', to: 'tables#index'
    delete '/delete/:id', to: 'tables#delete'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
