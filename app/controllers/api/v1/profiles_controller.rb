# app/controllers/api/v1/profiles_controller.rb
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