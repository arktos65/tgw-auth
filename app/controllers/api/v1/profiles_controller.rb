# frozen_string_literal: true

# app/controllers/api/v1/profiles_controller.rb
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
  class ProfilesController < ApiController
    before_action -> { doorkeeper_authorize! :public }, only: [:index]

    before_action only: [:create, :update, :destroy] do
      doorkeeper_authorize! :write
    end

    def index
      render json: Profile.recent
    end

    def create
      profile         = Profile.create!(profile_params)
      response.status = :created

      render json: { api_version: "api_v1", profile: profile }
    end

    private
      def profile_params
        profile_params = params[:profile]
        profile_params ? profile_params.permit(:name, :email, :username) : {}
      end
  end
end
