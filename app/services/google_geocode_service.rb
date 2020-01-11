class GoogleGeocodeService
  def self.get_latlong(address)
    self.get_json(address)
  end


  private

    def self.connection(address)
      Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |f|
        f.params[:address] = address
        f.params[:key] = ENV['GOOGLE_GEOCODE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(address)
      response = self.connection(address).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
