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

    # Return the service name as a string
    def service_name
      'TGW OAuth2 Provider::API'
    end

    # Return the service version as a string
    def service_version
      '0.2.0'
    end
  end
end