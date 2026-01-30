require_relative "file_opener"
require_relative "calculate"
require_relative "make_chart"


command = ARGV[0]
year, month = ARGV[1].split("/")
year = year.to_i
month = month.to_i
path = ARGV[2]

if command.nil? || year.nil? || month.nil? || path.nil?
  raise ArgumentError, "Please provide input"
end

valid_commands = ["-e", "-a", "-c"]
unless valid_commands.include?(command)
  raise ArgumentError, "Invalid command, please enter -e,-a or -c}"
end

if year <= 0
  raise ArgumentError, "Invalid year provided}"
end

if ["-a", "-c"].include?(command) && (month.nil? || month < 1 || month > 12)
  raise ArgumentError, "Month must be provided and between 1-12 with command -a or -c"
end


case command
when "-e"
  find_file(path, year)
  max_min()
when "-a"
  find_file(path, year, month)
  avg_values()
when "-c"
  find_file(path,year,month)
  require 'date'
  puts "#{@abbreviated_name} #{year}"
  draw_chart()
end
