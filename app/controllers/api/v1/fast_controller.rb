# app/controllers/api/v1/fast_controller.rb
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
class Api::V1::FastController < ActionController::Metal
  include AbstractController::Callbacks
  include ActionController::Head
  include Doorkeeper::Rails::Helpers

  before_action :doorkeeper_authorize!

  def index
    self.response_body = { ok: true }.to_json
  end
end