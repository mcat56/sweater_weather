require 'rails_helper'

describe 'sweater weather api' do
  it 'returns antipode weather and city information', :vcr do
    get "/api/v1/antipode?location=hong_kong"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json[:data][:attributes]).to have_key(:location_name)
    expect(json[:data][:attributes]).to have_key(:antipode_weather)
    expect(json[:data][:attributes]).to have_key(:search_location)

    expect(json[:data][:attributes][:location_name]).to eq('Jujuy')
    expect(json[:data][:attributes][:search_location]).to eq('Hong Kong')
    expect(json[:data][:attributes][:antipode_weather]).to have_key(:summary)
    expect(json[:data][:attributes][:antipode_weather]).to have_key(:current_temperature)
  end
end
