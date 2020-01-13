class GoogleDirectionsService

  def self.get_travel_time(origin, destination)
    self.get_json(origin, destination)[:routes].first[:legs].first[:duration]
  end

  private

    def self.connection(origin, destination)
      Faraday.new(url: 'https://maps.googleapis.com/maps/api/directions/json') do |f|
        f.params[:origin] = origin
        f.params[:destination] = destination
        f.params[:key] = ENV['GOOGLE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(origin, destination)
      response = self.connection(origin, destination).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
