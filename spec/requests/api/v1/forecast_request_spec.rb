require 'rails_helper'

describe 'sweater weather api' do
  it 'returns forecast data', :vcr do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
  end
end
