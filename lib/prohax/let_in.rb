require 'prohax/strucked'

class Container
  def initialize defines
    defines.each do |key, value|
      if value.respond_to? :call then
        self.class.class_eval {
          define_method(key) { |*args| value.call *args }
        }
      else
        self.class.class_eval {
          define_method(key) { value }
        }
      end
    end
  end
  
  alias :in :instance_eval
end

module Kernel    
  def let defines
    Container.new(defines)
  end
end
