# spec/integrations/api/v1/ping_spec.rb
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

require 'swagger_helper'

describe 'Ping API', type: :request, swagger_doc: 'v1/swagger.json' do

  path '/api/v1/ping' do

    get 'Performs service response check' do
      tags 'Monitoring'
      description 'Enables clients to perform a responsivness check on the API service.'
      produces 'application/json', 'application/xml'

      response '200', 'ping response' do
        schema type: :object,
               properties: {
                   service: { type: :string },
                   version: { type: :string },
                   timestamp: { type: :string }
               },
               required: ['service', 'version', 'timestamp']
        run_test!
      end
    end
  end
end
