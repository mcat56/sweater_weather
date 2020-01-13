require 'rails_helper'

describe 'can receive an image' do
  it 'returns antipode city and weather' do
    antipode = File.read('./spec/fixtures/amypode_response.json')

    stub_request(:get, 'http://amypode.herokuapp.com/api/v1/antipodes?lat=22.3193039&long=114.1693611').with(headers: { api_key: ENV['AMYPODE_API_KEY'] }).to_return(status: 200, body: antipode )
  end
end
