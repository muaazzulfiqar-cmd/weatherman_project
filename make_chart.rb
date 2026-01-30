def red(text)
  "\e[31m#{text}\e[0m"
end

def blue(text)
  "\e[34m#{text}\e[0m"
end

def draw_chart
  if @weather_arr.empty?
    puts "no data found"
  end

  @weather_arr.each do |x|
    day = x[:date].split("-")[2]

    max_temp = x[:max_temp]
    min_temp = x[:min_temp]

    min_temp = min_temp > 0 ? min_temp : 0
    
    puts "#{day}  #{blue('+' * min_temp)}#{red('+' * max_temp)} #{min_temp}C #{max_temp}C"
  end
end
