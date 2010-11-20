
module Util

  # Keeps time and tracks the progress of iterations.
  #
  class Timer
    
    def initialize(name, resolution)
      @name, @resolution = name, resolution
      @started = Time.now
      reset
      log "- Started #{@name} at #{@started}"
    end

    # Initiates and returns a new Timer object
    #
    def Timer.start(name="", resolution=1000)
      Timer.new(name, resolution)
    end      

    # Resets the current iteration tracking.
    #
    def reset
      @ticks, @last_tick = 0, Time.now
    end

    # Registers a step in the iteration being tracked.
    #
    def tick
      @ticks += 1
      if @ticks % @resolution == 0
        log "  - #{@name} #{@ticks} #{(@resolution.to_i / (Time.now - @last_tick)).to_i}/s."
        @last_tick = Time.now
        @resolution = (@resolution * 10) if @ticks % (@resolution * 10) == 0
      end
    end
    
    # Returns the duration of the timer so far.
    #
    def check(time=nil)
      time ||= @started
      d = Time.now - time
      return "#{d.to_s[0..4]} s" if d < 1
      return "#{d.to_i} s" if d < 60
      return "#{d.to_i/60} m"
    end

    # Logs a finishing message for an iteration, with average items per second etc.
    #
    def stop
      log "- Finished #{@name}: #{@ticks} items in #{check} (#{(@resolution.to_i / (Time.now - @last_tick)).to_i}/s)"
    end    
    
  end
  
end
