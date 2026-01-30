def find_file(path, year, month = 0)
  require "date"

  @weather_arr = []
  abbreviated_name = Date::ABBR_MONTHNAMES[month]

  unless Dir.exist?(path)
    puts "Folder not found: #{path}"
    return []
  end

  files = month == 0 ? Dir.glob(File.join(path, "*#{year}*")) : Dir.glob(File.join(path, "*#{year}*#{abbreviated_name}*"))
  open_file(files)

  @weather_arr
end

def open_file(files)
  files.each do |filename|
    File.foreach(filename).with_index do |line, i|
      next if i == 0

      values = line.strip.split(",")
      next if values.length < 10
      next if values[1].nil? || values[1].empty?

      weather_hash = {
        date:       values[0],
        max_temp:   values[1].to_i,
        mean_temp:  values[2].to_i,
        min_temp:   values[3].to_i,
        max_hum:    values[7].to_i,
        mean_hum:   values[8].to_i,
        min_hum:    values[9].to_i
      }

      @weather_arr << weather_hash
    end
  end
end
