Rails.application.routes.draw do
  # API documentation
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do

      # API Active Check
      get '/ping', to: 'ping#index'
    end
  end
end