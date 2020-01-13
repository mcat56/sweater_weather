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

    expect(json[:data][:attributes][:hourly_forecast].first).to have_key(:humidity)
    expect(json[:data][:attributes][:hourly_forecast].first).to have_key(:temperature)
    expect(json[:data][:attributes][:hourly_forecast].first).to have_key(:summary)
    expect(json[:data][:attributes][:hourly_forecast].first).to have_key(:icon)

    expect(json[:data][:attributes][:daily_forecast]).to have_key(:high)
    expect(json[:data][:attributes][:daily_forecast]).to have_key(:low)
    expect(json[:data][:attributes][:daily_forecast]).to have_key(:today)
    expect(json[:data][:attributes][:daily_forecast]).to have_key(:tonight)
    expect(json[:data][:attributes][:daily_forecast]).to have_key(:icon)

    expect(json[:data][:attributes][:current_weather]).to have_key(:summary)
    expect(json[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(json[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(json[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(json[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(json[:data][:attributes][:current_weather]).to have_key(:uvIndex)
    expect(json[:data][:attributes][:current_weather]).to have_key(:icon)
  end
end
