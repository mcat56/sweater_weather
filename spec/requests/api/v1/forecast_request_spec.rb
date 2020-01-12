require 'rails_helper'

describe 'sweater weather api' do
  it 'returns forecast data', :vcr do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a(Hash)
    expect(json[:data][:attributes]).to have_key(:hourly_forecast)
    expect(json[:data][:attributes]).to have_key(:daily_forecast)
    expect(json[:data][:attributes]).to have_key(:current_weather)
  end
end
