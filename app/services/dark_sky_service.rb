class DarkSkyService

  def self.get_forecast(latlong)
    self.get_json(latlong)
  end

  private

    def self.connection(latlong)
      Faraday.new(url: "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{latlong}") do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(latlong)
      response = self.connection(latlong).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
