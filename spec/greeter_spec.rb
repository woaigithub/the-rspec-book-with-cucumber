
class RSpecGreeter
  def greet
    "hello"
  end
end

describe "RSpec Greeter" do
  it "should say 'hello' when it receive the greet message" do
    greeter=RSpecGreeter.new

    greeting=greeter.greet
    greeting.should == "hello"
  end
end
