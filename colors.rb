
#
# PUTS WITH SHINY HAPPY COLORS
#
#
# TODO
# - Extract width, height and original color
# - Set background color (4 instead of 3?)
# - Full set of rectangular special characters

module Util
  
  module Color
  
    @@colors = {
      :black   => 0,
      :red     => 1,
      :green   => 2,
      :yellow  => 3,
      :blue    => 4,
      :magenta => 5,
      :cyan    => 6,
      :white   => 7
    }

    def paint string, options={}
      options[:color] && print("\033[3#{@@colors[options[:color]]}m")  
      options[:pos]   && print("\033[#{options[:pos][0]};#{options[:pos][1]}f")
      print string
    end 

    def soft_reset
      print "\033c"
    end

  end
  
  include Color
  
end