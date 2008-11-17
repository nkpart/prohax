
class Strucked
  def self.build *fields
    cls = Class.new
    cls.class_eval <<EOS
      def self.fields
        #{fields.inspect}
      end
      
      def initialize *values
        if self.class.fields.size != values.size
          raise ArgumentError.new("Wrong number of arguments, expected \#\{self.class.fields.size\} got \#\{values.size\}")
        end
        self.class.fields.zip(values).each do |fld, value|
          self.instance_variable_set("@\#\{fld\}", value)
        end
      end
EOS
    cls
  end
end
