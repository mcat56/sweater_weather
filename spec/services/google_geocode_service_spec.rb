require 'rails_helper'

describe 'can receive latitude and longitude for address' do
  it 'returns coordinates' do
    latlong = File.read('./spec/fixtures/google_geocode_response.json')

    stub_request(:get, 'https://maps.googleapis.com/maps/api/geocode/json').with(query: { address: 'denver, co', key: ENV['GOOGLE_API_KEY']} ).to_return(status: 200, body: latlong )
  end
end
