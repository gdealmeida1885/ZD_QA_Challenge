class WeatherPage < DefaultPage
    
    def get_weather(city, api_key=self.api_key)
        @q = {
            appid: api_key,
            units: self.units,
            q: city
        }


        self.class.get('/weather', query: @q)
    end

end