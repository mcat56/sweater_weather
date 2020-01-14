require 'rails_helper'


describe 'sweater weather api' do
  before(:each) do
    @user = User.create(email: 'foofoo@gmail.com', password: 'password', password_confirmation: 'password')
  end
  it 'returns roadtrip info', :vcr do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)
    post '/api/v1/road_trip', :params => { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: "#{@user.api_key}" }.to_json, :headers => { "CONTENT_TYPE" => "application/json"  }

    expect(response.status).to eq(200)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:type]).to eq('roadtrip')
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:arrival_forecast)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:arrival_forecast]).to have_key(:temperature)
  end
  it 'returns error if no api', :vcr do
    post '/api/v1/road_trip', :params => { origin: 'Denver,CO', destination: 'Pueblo,CO' }.to_json, :headers => { "CONTENT_TYPE" => "application/json"  }

    expect(response.status).to eq(401)
    expect(response.body).to eq('Unauthorized')
  end
  it 'returns error if invalid api', :vcr do
    post '/api/v1/road_trip', :params => { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: 'fakerfake' }.to_json, :headers => { "CONTENT_TYPE" => "application/json"  }

    expect(response.status).to eq(401)
    expect(response.body).to eq('Unauthorized')
  end
end
