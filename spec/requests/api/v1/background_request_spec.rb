require 'rails_helper'

describe 'sweater weather api' do
  it 'returns background image', :vcr do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a(Hash)
    expect(json[:data][:attributes][:background]).to have_key(:image_url)
  end
end
