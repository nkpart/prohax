require File.dirname(__FILE__) + '/spec_helper.rb'

describe Strucked do
  it "should create a class with instance variables set" do
    x = Strucked.build(:foo).new 5
    x.instance_variable_get("@foo").should == 5
  end

  it "should fail on create if the number of args is wrong" do
    proc { 
      Strucked.build(:foo, :bar).new("a")
    }.should raise_error
  end
  
  it "should not fail if multiple Struckeds are used" do
    f = Strucked.build(:f)
    a = Strucked.build(:a, :b)
    
    f.new(1).instance_variable_get("@f").should == 1
    a.new(1,2).instance_variable_get("@b").should == 2
  end
  
  it "should work with inheritance" do
    class C < Strucked.build(:c); end
    C.fields.should == [:c]
    C.new(5).instance_variable_get("@c").should == 5 
  end
  
  it "does not create accessors" do
    proc { Strucked.new(:foo).new(5).foo }.should raise_error
  end

end

