
class Strucked
  def self.new *fields
    cls = Class.new
    cls.class_eval {
      @@fields = fields

      def initialize *values
        if @@fields.size != values.size
          raise ArgumentError.new("Wrong number of arguments, expected #{@@fields.size} got #{values.size}")
        end
        @@fields.zip(values).each do |fld, value|
          self.instance_variable_set("@#{fld}", value)
        end
      end
    }
    cls
  end
end
