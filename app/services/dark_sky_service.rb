class DarkSkyService

  def self.get_forecast(coord)
    self.get_json(coord)
  end

  def self.get_destination_forecast(coord, travel_time)
    self.get_json(coord, (',' + (DateTime.now + (travel_time/60).minutes).to_s.sub(' ','T').sub(' ', '')) )
  end

  private

    def self.connection(coord,date = nil)
      Faraday.new(url: "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{coord.lat},#{coord.lng}#{date}") do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(coord, date = nil)
      response = self.connection(coord,date).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
