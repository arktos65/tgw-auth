# frozen_string_literal: true

Rails.application.routes.draw do
  # Authentication and authorization resources
  use_doorkeeper
  devise_for :users
  devise_for :admins

  # API documentation
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  namespace :api do
    namespace :v1 do
      resources :profiles
      resources :users
      resources :admins

      get "/me",   to: "credentials#me"
      get "/fast", to: "fast#index"
      get "/status", to: "status#index"
      get "/ping", to: "ping#index"
    end
  end

  # Default landing page for service provider
  get "/home", to: "home#index"
  root to: "home#index"
end
