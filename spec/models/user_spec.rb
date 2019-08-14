require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :albums }
  it { should have_many :photos }
  it { should have_many :comments }
  it { should validate_presence_of :user_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :encrypted_password }

  FactoryBot.find_definitions

  it 'should create a new user' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    expect(user.user_name).to eq 'test user'
    expect(user.email).to eq 'test@example.com'
  end
end
