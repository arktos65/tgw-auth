# frozen_string_literal: true

# app/controllers/oauth/applications_controller.rb
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
class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  layout "doorkeeper/admin" unless Doorkeeper.configuration.api_only

  before_action :authenticate_admin!
  before_action :set_application, only: %i[show edit update destroy]

  def index
    @applications = Doorkeeper::Application.ordered_by(:created_at)

    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  # only needed if each application must have some owner
  def create
    @application = Doorkeeper::Application.new(application_params)
    @application.owner = current_admin if Doorkeeper.configuration.confirm_application_owner?
    if @application.save
      flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :create])
      redirect_to oauth_application_url(@application)
    else
      render :new
    end
  end

  private
    def set_application
      @application = Doorkeeper::Application.find(params[:id])
    end
end
