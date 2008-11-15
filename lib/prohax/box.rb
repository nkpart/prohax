class Object
  def box
    self.is_a?(Array) ? self : [self]
  end
end
