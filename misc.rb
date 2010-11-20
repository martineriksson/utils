
class Hash

  # Correct a nasty error in Ruby < 1.9
  #
  def proper_select(&block)
    Hash[*select(&block).flatten]
  end

end

class Fixnum
  
  # Alias for self % 2 == 0
  #
  def is_even?
    self % 2 == 0
  end

  # Alias for self % 2 == 1
  #
  def is_odd?
    self % 2 == 1
  end

end

class Array
  
  def random
    self[rand(self.length)]
  end
  
end

class String
  
  # This aims to compact strings to more generic versions (for later comparisons)
  #
  def compact
    crunched = self.dup
    crunched.downcase!
    [" ", "-", "'", ",", "/", " and ", "&", " of "].each { |s| crunched.gsub!(s, '') }
    # This should be done with a regexp, removing everyting except /a-z/
    crunched
  end

end

module Util

  # Outputs current time as:
  #
  #   Today, 16.20
  #   Yesterday, 16.20
  #   2010-11-20, 16.20
  #
  # Found somewhere on the web...
  #
  def date(epoch)
    time = Time.at(epoch)
    now = Time.now
    if now.year == time.year
      if now.yday == time.yday
        return time.strftime("Today, %H:%M")
      elsif now.yday == time.yday + 1
        return time.strftime("Yesterday, %H:%M")
      end
    end
    time.strftime("%Y-%b-%d, %H:%M")
  end

end
