
class String

  # Returns a corresponding class object
  #
  def to_class
    Kernel.const_get self.capitalize rescue nil
  end
end

class Symbol

  # Returns a corresponding class object
  #
  def to_class
    self.to_s.to_class
  end
end

class Class

  # The reverse of the built in 'ancestors'
  #
  def descendants
    ObjectSpace.each_object(Class).select { |c| c < self }
  end
end

class Object

  # Singleton class extraction
  #
  def singleton_class
    class << self
      self
    end
  end

  # Eval in the scope of the singleton class
  #
  def singleton_eval &block
    singleton_class.instance_eval &block
  end
  
  # Define a method in the singleton class
  #
  def singleton_def name, &block
    singleton_eval { define_method name, &block }
  end

  # On-the-fly error classes
  #
  def self.const_missing(error_name)
     if error_name.to_s =~ /Error\z/
       const_set(error_name, Class.new(RuntimeError))
     end
  end

end
