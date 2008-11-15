require File.dirname(__FILE__) + '/spec_helper.rb'

describe "the either function" do
  it "should be [nil, exception] in case of failure" do
    f = ArgumentError.new "fail"
    left, right = either { raise f  }
    left.should be_nil
    right.should == f
  end

  it "should be [result, nil] in case of success" do
    left, right = either { 5 }
    left.should == 5
    right.should be_nil
  end
end

