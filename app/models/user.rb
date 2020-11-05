# frozen_string_literal: true

# app/models/user.rb
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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :access_grants, class_name:  "Doorkeeper::AccessGrant",
            foreign_key: :resource_owner_id,
            dependent:   :delete_all

  has_many  :access_tokens, class_name:  "Doorkeeper::AccessToken",
            foreign_key: :resource_owner_id,
            dependent:   :delete_all

  has_many :oauth_applications, class_name: "Doorkeeper::Application", as: :owner
end
