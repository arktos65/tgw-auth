# frozen_string_literal: true

# spec/requests/oauth/authorize.rb
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
require "rails_helper"

=begin
curl -F response_type=code \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-F username=user@example.com \
-X POST http://localhost:3000/oauth/authorize
=end

RSpec.describe "OAuth Authorize API", type: :request do
  describe "POST /oauth/authorize" do
    before {
      @oauth_app = AuthSpecHelper.token_scopes("public")
      headers = {"ACCEPT" => "application/json"}
      post "/oauth/authorize", :params => {
          :authorization => {
              :response_type => "code",
              :client_id => @oauth_app.client_id,
              :client_secret => @oauth_app.client_secret,
              :username => @oauth_app.USER_ACCOUNT,
              :redirect_uri => @oauth_app.redirect_uri
          }
      },
           :headers => headers
    }

    it "should return a JSON response" do
      expect(response.content_type).to eq("application/json")
    end

    it "returns a valid status code" do
      expect(response).to have_http_status(200)
    end
  end
end