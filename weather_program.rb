require "net/http"
require "uri"
require "json"
ip = Net::HTTP.get(URI("https://ip-fast.com/api/ip/"))

location_params = {
    'auth' => '460188625123375880557x101725',
    'locate' => ip,
    'geoit' => 'json'
}
location_uri = URI('https://geocode.xyz')
location_uri.query = URI.encode_www_form(location_params)
response = Net::HTTP.get_response(location_uri)
location_response = JSON.parse(response.read_body)
location_city = location_response['city']
location_state = location_response['state']
location_country = location_response['country']
weather_longitude = location_response['longt']
weather_latitude = location_response['latt']


weather = Net::HTTP.get(URI("https://api.open-meteo.com/v1/forecast?latitude=#{weather_latitude}&longitude=#{weather_longitude}&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch&timezone=America%2FChicago"))
weather_response = JSON.parse(weather)
daily_weather = weather_response["daily"]
daily_high = daily_weather["temperature_2m_max"]
daily_low = daily_weather["temperature_2m_min"]
days = daily_weather["time"]

puts "Below is the weather forecast for the next 7 days in #{location_city} #{location_state}, #{location_country}."
puts "Temperatures are in degrees fahrenheit."
puts "On #{days[0]} the high temperature will be #{daily_high[0]} degrees and the low temperature will be #{daily_low[0]} degrees."
puts "On #{days[1]} the high temperature will be #{daily_high[1]} degrees and the low temperature will be #{daily_low[1]} degrees."
puts "On #{days[2]} the high temperature will be #{daily_high[2]} degrees and the low temperature will be #{daily_low[2]} degrees."
puts "On #{days[3]} the high temperature will be #{daily_high[3]} degrees and the low temperature will be #{daily_low[3]} degrees."
puts "On #{days[4]} the high temperature will be #{daily_high[4]} degrees and the low temperature will be #{daily_low[4]} degrees."
puts "On #{days[5]} the high temperature will be #{daily_high[5]} degrees and the low temperature will be #{daily_low[5]} degrees."
puts "On #{days[6]} the high temperature will be #{daily_high[6]} degrees and the low temperature will be #{daily_low[6]} degrees."
