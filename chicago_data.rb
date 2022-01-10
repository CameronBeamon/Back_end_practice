require "http"
system "clear"

puts "Welcome to weather appQ"

while true
  puts "What city would you like to inquire about? Press Q to quit:"
  name = gets.chomp
  if name.upcase == "Q"
    break
  end
  puts "Would you like a 5 day forcast as well? [Y]es or [N]o"
  five_day = gets.chomp
  puts "Would you like the temperature in [F]arehheit or [C]elsius?:"
  temp_answer = gets.chomp
  if temp_answer.upcase == "F"
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{name}&units=imperial&APPID=#{ENV["OPEN_WEATHER_API_KEY"]}")
    weather_data = JSON.parse(response.body)

    temperature = weather_data["main"]["temp"]
    temperature_max = weather_data["main"]["temp"]
    temperature_min = weather_data["main"]["temp"]
    wind = weather_data["wind"]["speed"]
    description = weather_data["weather"][0]["description"]
    p temperature_max
  elsif temp_answer.upcase == "C"
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{name}&units=metric&APPID=#{ENV["OPEN_WEATHER_API_KEY"]}")
    weather_data = JSON.parse(response.body)

    temperature = weather_data["main"]["temp"]
    temperature_max = weather_data["main"]["temp"]
    temperature_min = weather_data["main"]["temp"]
    wind = weather_data["wind"]["speed"]
    description = weather_data["weather"][0]["description"]
    p temperature_max
  end
  if five_day.upcase == "Y" && temp_answer.upcase == "F"
    five_day_get = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{name}&units=imperial&APPID=#{ENV["OPEN_WEATHER_API_KEY"]}")
    puts five_day_get
  elsif five_day.upcase == "Y" && temp_answer.upcase == "C"
    five_day_get = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{name}&units=metric&APPID=#{ENV["OPEN_WEATHER_API_KEY"]}")
    puts five_day_get
  end
end

# puts "Today in Chicago it is #{temperature} degrees with #{description}."
