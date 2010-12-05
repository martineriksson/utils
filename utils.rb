
dir = File.expand_path File.dirname __FILE__
Dir[dir + '/*.rb'].each { |file| require file }
