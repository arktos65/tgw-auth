# frozen_string_literal: true

# app/controllers/api/v1/api_controller.rb
#
# Copyright 2019-2020 TGW Consulting, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
module Api::V1
  class ApiController < ::ApplicationController
    # Devise code
    before_action :configure_permitted_parameters, if: :devise_controller?

    respond_to :json

    # Doorkeeper methods
    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    protected
      # Devise methods
      # Authentication key(:username) and password field will be added automatically by devise.
      def configure_permitted_parameters
        added_attrs = [:email, :first_name, :last_name]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      end

      # Return the service name as a string
      def service_name
        "TGW OAuth2 Provider::API"
      end

      # Return the service version as a string
      def service_version
        "0.3.0"
      end
  end
end
