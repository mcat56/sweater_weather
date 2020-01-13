class PexelService

  def self.get_photo(location)
    self.get_json(location)[:photos].first[:src][:medium]
  end

  private

    def self.connection(location)
      Faraday.new(url: 'https://api.pexels.com/v1/search') do |f|
        f.params[:query] = location
        f.headers[:Authorization] = ENV['PEXEL_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(location)
      response = self.connection(location).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
