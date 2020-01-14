class DarkSkyService

  def self.get_forecast(coord)
    self.get_json(coord)
  end

  def self.get_destination_forecast(coord, travel_time, zone)
    self.get_json(coord,( ',' + (DateTime.now.in_time_zone(zone) + ((travel_time.to_f)/1440)).to_time.to_s))
  end

  private

    def self.connection(coord, date=nil)
      Faraday.new(url: "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{coord.lat},#{coord.lng}#{date}") do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(coord, date=nil)
      response = self.connection(coord).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
