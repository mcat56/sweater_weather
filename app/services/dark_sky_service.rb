class DarkSkyService

  def self.get_forecast(coord)
    self.get_json(coord)
  end

  private

    def self.connection(coord)
      Faraday.new(url: "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{coord.lat},#{coord.lng}") do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(coord)
      response = self.connection(coord).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
