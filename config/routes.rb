Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"
  # get 'home/index'

  # API documentation
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do

      # API Active Check
      get '/ping', to: 'ping#index'
      # API Health Check
      get '/status', to: 'status#index'
    end

  end
end