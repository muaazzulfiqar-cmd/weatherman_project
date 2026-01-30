require_relative "file_opener"
require "date"

def change_date(date_str)
  date = Date.parse(date_str)
  date.strftime("%B %-d")
end

def max_min
  max_temp_day = @weather_arr.max_by { |x| x[:max_temp] }
  min_temp_day = @weather_arr.min_by { |x| x[:min_temp] }
  max_hum_day  = @weather_arr.max_by { |x| x[:max_hum] }

  puts "Highest: #{max_temp_day[:max_temp]}C on #{change_date(max_temp_day[:date])}"
  puts "Lowest: #{min_temp_day[:min_temp]}C on #{change_date(min_temp_day[:date])}"
  puts "Humid: #{max_hum_day[:max_hum]}% on #{change_date(max_hum_day[:date])}"
end

def avg_values
  n = @weather_arr.size

  if n == 0
    puts "No data found for given month/year."
    return
  end

  highest_avg = 0.0
  lowest_avg = 0.0
  humidity_avg = 0.0

  @weather_arr.each do |x|
    
    highest_avg += x[:max_temp]
    lowest_avg += x[:min_temp]
    humidity_avg += x[:max_hum]
  end

  puts "Average Max Temp: #{(highest_avg / n).to_i}C"
  puts "Average Min Temp: #{(lowest_avg / n).to_i}C"
  puts "Average Humidity: #{(humidity_avg / n).to_i}%"
end
