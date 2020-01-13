class AmypodeService

  def self.get_coordinates(coord)
    self.get_json(coord)[:data][:attributes]
  end

  private

    def self.connection(coord)
      Faraday.new(url: 'http://amypode.herokuapp.com/api/v1/antipodes') do |f|
        f.params[:lat] = coord.lat
        f.params[:long] = coord.lng
        f.headers[:api_key] = ENV['AMYPODE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(coord)
      response = self.connection(coord).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
