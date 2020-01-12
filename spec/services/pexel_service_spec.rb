require 'rails_helper'

describe 'can receive an image' do
  it 'returns image url for location' do
    forecast = File.read('./spec/fixtures/pexel_response.json')

    stub_request(:get, "https://api.pexels.com/v1/search?query=denver").with(headers: { Authorization: ENV['PEXEL_API_KEY'] }).to_return(status: 200, body: forecast )
  end
end
