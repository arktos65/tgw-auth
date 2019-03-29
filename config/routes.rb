Rails.application.routes.draw do
  # Use for login and autorize all resource
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end

  root to: "home#index"

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