
module Util

  class Logger

    # Like puts, but writes also to a log file. Writing to STDOUT is optional.
    #
    def self.log(message)
      @@logfile.puts "#{time} #{message}"
      STDOUT.puts message unless LOGGING == false
    end

    # Better time format
    #
    def self.time
      Time.now.strftime '[%Y-%m-%d %H:%M]'
    end

    @@logfile = open 'log.txt', 'a'

    @@logfile.puts "\n#{time} == LOGGING INITIATED #{'='*40}"
  
  end

  # Accessor method for the Util::Logger class
  #
  def log(message)
    Logger.log message
  end

end
