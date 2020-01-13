class GoogleGeocodeService

  def self.get_coordinates(address)
    self.get_json(address)[:results].first[:geometry][:location]
  end

  def self.get_city(coords)
    self.get_json(coords)[:results].first[:formatted_address].split(', ')[1]
  end

  private

    def self.connection(params)
      Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |f|
        if params.class == String
          f.params[:address] = params
        else
          f.params[:latlng] = "#{params.lat},#{params.lng}"
        end
        f.params[:key] = ENV['GOOGLE_GEOCODE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(params)
      response = self.connection(params).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
