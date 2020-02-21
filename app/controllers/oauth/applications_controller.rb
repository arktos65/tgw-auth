# frozen_string_literal: true

# app/controllers/oauth/applications_controller.rb
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
      @application = current_admin.oauth_applications.find(params[:id])
    end
end
