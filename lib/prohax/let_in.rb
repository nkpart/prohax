require 'prohax/strucked'

class LetInContainer
  def metaclass
    class <<self
      self
    end
  end
  
  def initialize defines
    defines.each do |key, value|
      if value.respond_to? :call then
        self.metaclass.class_eval {
          define_method(key) { |*args| value.call *args }
        }
      else
        self.metaclass.class_eval {
          define_method(key) { value }
        }
      end
    end
  end
  
  alias :in :instance_eval
end

module Kernel    
  def let defines
    LetInContainer.new(defines)
  end
end
