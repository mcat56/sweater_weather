require 'rails_helper'

describe 'sweater weather api' do
  before(:each) do
    @user = User.create(email: 'foofoo@gmail.com', password: 'password', password_confirmation: 'password')
  end
  it 'can login a registered user with valid credentials' do
    post "/api/v1/sessions", :params => '{ "email": "foofoo@gmail.com", "password": "password" }', :headers => { "CONTENT_TYPE" => "application/json"  }

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect( JSON.parse(response.body)['data']['attributes']['api_key']).to eq(@user.api_key)
  end
  it 'returns a 400 status for unsuccessful requests with a description' do

    post "/api/v1/sessions", :params => '{ "email": "foofoo@gmail.com" }', :headers => { "CONTENT_TYPE" => "application/json"  }

    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)['data']['attributes']['message']).to eq('Please enter valid credentials')
  end
  it 'returns a 400 status and message if account not found' do
    post "/api/v1/sessions", :params => '{ "email": "barbar@gmail.com", "password": "password" }', :headers => { "CONTENT_TYPE" => "application/json"  }

    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)['data']['attributes']['message']).to eq('No account found')
  end
end
