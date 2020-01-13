require 'rails_helper'

describe 'sweater weather api' do
  it 'returns background image', :vcr do
    get "/api/v1/antipode?location=hong_kong"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
  end
end
