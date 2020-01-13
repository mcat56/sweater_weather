require 'rails_helper'

describe 'sweater weather api' do
  it 'creates a user with valid credentials and an api key' do

    post "/api/v1/users", params: { email: 'foofoo@gmail.com', password: 'bars', password_confirmation: 'bars'}
    expect(response).to be_successful
    user = User.last

    expect(user.email).to eq('foofoo@gmail.com')
    expect(user.api_key).to_not eq(nil)
    expect(response.status).to eq(201)
    expect(response.body).to eq(user.api_key)
  end
  it 'creates returns a 400 status for unsuccessful requests with a description' do

    post "/api/v1/users", params: { password: 'loop', password_confirmation: 'bars'}

    expect(User.all).to eq([])
    expect(response.status).to eq(400)
    expect(response.body).to eq("Email can't be blank and Password confirmation doesn't match Password")
  end
end
