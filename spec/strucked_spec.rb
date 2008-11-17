require File.dirname(__FILE__) + '/spec_helper.rb'

describe Strucked do
  it "should create a class with instance variables set" do
    x = Strucked.new(:foo).new 5
    x.instance_variable_get("@foo").should == 5
  end

  it "should fail on create if the number of args is wrong" do
    proc { 
      Strucked.new(:foo, :bar).new("a")
    }.should raise_error
  end
  
  it "does not create accessors" do
    proc { Strucked.new(:foo).new(5).foo }.should raise_error
  end

end

