require 'rails_helper'

describe 'sweater weather api' do
  it 'creates a user' do

    post "/api/v1/users", params: { email: 'foofoo@gmail.com', password: 'bars', password_confirmation: 'bars'}
    expect(response).to be_successful
    user = User.last

    expect(user.email).to eq('foofoo@gmail.com')
  end
end
