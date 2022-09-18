# frozen_string_literal: true

Rails.application.routes.draw do
  scope "users" do
    post '/create', to: 'users#create'
    get '/index', to: 'users#index'
    post '/login', to: 'users#login'
    delete '/delete/:id', to: 'users#delete'
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
