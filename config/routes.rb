Rails.application.routes.draw do
  root to: "home#index"
  # get 'home/index'

  # API documentation
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
      }, skip: [:sessions, :password]
      devise_for :admins, controllers: {
        registrations: 'api/v1/admins/registrations',
      }, skip: [:sessions, :password]

      # API Active Check
      get '/ping', to: 'ping#index'
      # API Health Check
      get '/status', to: 'status#index'
    end

  end
end