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
end
  
class LetProxy
  def initialize defines
    @defines = defines
  end

  def in &blk
    Container.new(@defines).instance_eval &blk
  end
end

module Kernel    
  def let defines
    LetProxy.new(defines)
  end
end
