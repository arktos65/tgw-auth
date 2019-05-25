# frozen_string_literal: true

# app/controllers/api/v1/api_controller.rb
#
# Copyright 2019 TGW Consulting, LLC. All rights reserved.
#
# This source code is proprietary, confidential information of TGW Consulting, LLC.
# It contains TGW Consulting intellectual property, including trade secrets and
# copyright-protected authorship, and may include patentable inventions. You may
# not distribute this source code outside of TGW Consulting without express written
# permission from management. TGW Consulting does not claim ownership of included
# open source software components, which are subject to their own licenses.
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
        "0.2.0"
      end
  end
end
