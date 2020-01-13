require 'rails_helper'

describe 'sweater weather api' do
  it 'creates a user with valid credentials and an api key' do

    post "/api/v1/users", params: { email: 'foofoo@gmail.com', password: 'bars', password_confirmation: 'bars'}
    expect(response).to be_successful
    user = User.last

    expect(user.email).to eq('foofoo@gmail.com')
    expect(user.api_key).to_not eq(nil)

    require "pry"; binding.pry
  end
  it 'creates returns a 400 status for unsuccessful requests with a description' do

    post "/api/v1/users", params: { password: 'loop', password_confirmation: 'bars'}

    require "pry"; binding.pry


  end
end
