require 'rails_helper'

describe 'can receive forecast for latitude and longitude' do
  it 'returns full forecast' do
    forecast = File.read('./spec/fixtures/darksky_response.json')

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/39.7392358,-104.990251").to_return(status: 200, body: forecast )
  end
end
