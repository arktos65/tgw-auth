# app/controllers/api/v1/admins_controller.rb
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
  class AdminsController < ApiController
    before_action -> { doorkeeper_authorize! :public }, only: [:index]

    before_action only: [:create, :update, :destroy] do
      doorkeeper_authorize! :write
    end

    def index
      respond_with Admin.recent
    end

    def create
      respond_with "api_v1", User.create!(params[:admin])
    end
  end
end
