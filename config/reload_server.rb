require 'listen'

RESTART_COMMAND = 'touch tmp/restart.txt'

base_dir = __dir__ || File.expand_path('.')

directories = [
  File.expand_path('../app', base_dir),
  File.expand_path('../config', base_dir),
]

begin
  listener = Listen.to(*directories) do |modified, added, removed|
    puts "update: modified=#{modified}, added=#{added}, removed=#{removed}"
    puts 'puma restart...'
    system(RESTART_COMMAND)
  end

  listener.start
  puts 'watch started.'
  sleep
rescue StandardError => e
  puts "error: #{e.message}"
end
