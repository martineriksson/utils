
Contents
========

* Metaprogramming helpers
* Timer/Ticker (keeps time and ticks analysis output during iterations).
* Logger 
* ts - helpers for working with tab separated files.

Metaprogramming
---------------

- Singleton class methods, singleton_eval, singleton_def etc
  - Object#singleton_class
  - Object#singleton_eval
  - Object#singleton_def
- to_class for strings and symbols
  - String#to_class
  - Symbol#to_class
- On-the-fly Error classes
  - Object#constant_missing
- Misc.
  - Class#descendants

Timer
-----

Keeps time and generates continous logging output during iterations:

    timer = Timer.start "loading data"
    something do |etc|
    	#some code
    	timer.tick
    end
    timer.stop

This outputs:

    Started loading data at Sat Nov 20 00:41:41 +0100 2010
    - loading data 1000 1046/s.
    - loading data 2000 3200/s.
    ...
    - parsing TSV file 80000 669/s.
    - parsing TSV file 90000 485/s.
    Finished loading data: 93114 items in 1 m (1003/s)

Logger
------

Tab separated data helpers
--------------------------
