require 'rails_helper'

FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    user_name { 'test user'}
    password { '123456' }
  end
end
