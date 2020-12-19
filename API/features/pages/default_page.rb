class DefaultPage
    include HTTParty
    attr_accessor :api_key, :units
    base_uri 'api.openweathermap.org/data/2.5/'

    def initialize
        self.api_key = '5ad71750021deb486fe1e9f2689f6d80'
        self.units = 'metric'
    end
end