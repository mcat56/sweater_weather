class DarkSkyService
  def self.get_latlong(location)
    self.get_json(location)
  end


  private

    def self.connection(location)
      Faraday.new(url: 'https://api.darksky.net/forecast') do |f|
        f.params[:address] = location
        f.params[:key] = ENV['GOOGLE_GEOCODE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(location)
      response = self.connection(location).get
      JSON.parse(response.body, symbolize_names: true)
    end


end
