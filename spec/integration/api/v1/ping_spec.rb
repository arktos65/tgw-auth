# frozen_string_literal: true

# spec/integrations/api/v1/ping_spec.rb
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
require "swagger_helper"

describe "Ping API", type: :request, swagger_doc: "v1/swagger.json" do
  path "/api/v1/ping" do
    get "Performs service response check" do
      tags "Monitoring"
      description "Perform a response check to see if OAuth2 API is accepting requests."
      produces "application/json", "application/xml"

      response "200", "ping response" do
        schema type: :object,
               properties: {
                   service: { type: :string },
                   version: { type: :string },
                   timestamp: { type: :string }
               },
               required: ["service", "version", "timestamp"]
        run_test!
      end
    end
  end
end
