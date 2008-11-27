require File.dirname(__FILE__) + '/spec_helper.rb'

describe "The let().in {} syntax" do
  it "should be let-like and in-ish" do
    let(
      :foo => 5 
    ).in { 
      foo 
    }.should == 5
  end

  it "should be mad" do
    x = 5
    let(
      :plus => proc { |a,b| a + b },
      :times => proc { |a,b| a * b },
      :five => proc { 5 },
      :fast_five => 5
    ).in { 
      plus(x, times(five, plus(1, fast_five)))
    }.should == 35
  end
  
  it "should have separate scopes" do
    let(:three => 3).in { three }.should == 3
    proc {
      let(:five => 5).in { three }
    }.should raise_error
  end
end
