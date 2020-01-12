require 'rails_helper'

describe 'sweater weather api' do
  it 'returns background image', :vcr do

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a(Hash)
    expect(json[:data][:attributes][:background]).to have_key(:image_url)
  end
end
