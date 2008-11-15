require File.dirname(__FILE__) + '/spec_helper.rb'

describe "the box function" do
  it "should wrap singles in arrays" do
    5.box.should == [5]
    {}.box.should == [{}]
  end

  it "should leave arrays alone" do
    [1].box.should == [1]
  end
end

