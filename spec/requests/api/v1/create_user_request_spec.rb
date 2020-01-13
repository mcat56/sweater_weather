require 'rails_helper'

describe 'sweater weather api' do
  it 'creates a user with valid credentials and an api key' do

    post "/api/v1/users", :params => '{ "email": "foofoo@gmail.com", "password": "password", "password_confirmation": "password" }', :headers => { "CONTENT_TYPE" => "application/json"  }
    expect(response).to be_successful
    user = User.last

    expect(user.email).to eq('foofoo@gmail.com')
    expect(user.api_key).to_not eq(nil)
    expect(response.status).to eq(201)
    expect(JSON.parse(response.body)['api_key']).to eq(user.api_key)
  end
  it 'returns a 400 status for unsuccessful requests with a description' do

    post "/api/v1/users", :params => '{ "password": "password", "password_confirmation": "woops" }', :headers => { "CONTENT_TYPE" => "application/json"  }

    expect(User.all).to eq([])
    expect(response.status).to eq(400)
    expect(response.body).to eq("Email can't be blank and Password confirmation doesn't match Password")
  end
end
