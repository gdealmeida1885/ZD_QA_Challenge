Feature: Weather
    As someone that is worried about leaving my home with a rainy weather
    I must be able to check the current weather

    
    Scenario: It should search the weather if API Key and City are corrects
        When I search for the weather on the city of "São Paulo"
        Then the temperature must be above 10.00 degrees

    
   Scenario: It should return error message if api key is invalid
        When I search for the weather on the city of "New York"
        But my API key is invalid
        Then I must see the message "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info." and the status code 401

    Scenario: It should return error message if api key is blank
        When I search for the weather on the city of "New York"
        But  I don't have an valid API key
        Then I must see the message "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info." and the status code 401 

    Scenario: It should return error message if city is invalid
        When I search for the weather on the city of "XPTO"
        Then I must see the message "city not found" and the status code 404

    Scenario: It should return error message if city is blank
       When I search for the weather on the city of ""
       Then I must see the message "Nothing to geocode" and the status code 400
