When("I search for the weather on the city of {string}") do |city_name|
    @weather_page = WeatherPage.new
    @city_name = city_name
    @response = @weather_page.get_weather(@city_name)
end
  
Then("the temperature must be above {float} degrees") do |temperature|
    @response_message = JSON.parse(@response.body)
    expect(@response.code).to eql 200
    expect(@response_message['main']['temp']).to be > temperature
end
  
When("my API key is invalid") do
    @response = @weather_page.get_weather(@city_name, '1231411231312')
end
  
Then("I must see the message {string} and the status code {int}") do |error_message, status_code|
    @response_message = JSON.parse(@response.body)
    expect(@response.code).to eql status_code
    expect(@response_message['message']).to include error_message
end
  
When("I don't have an valid API key") do
    @response = @weather_page.get_weather(@city_name, "")
end