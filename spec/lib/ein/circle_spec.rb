require 'spec_helper'

module Ein
describe Circle do
  it "calculates the distance to other circle" do
    circle1 = Circle.new(Position.new(0,0), 100)
    circle2 = Circle.new(Position.new(300,0), 100)
    expect(circle1.distance_to(circle2)).to eq(100)

    circle2 = Circle.new(Position.new(200,0), 100)
    expect(circle1.distance_to(circle2)).to eq(0)

    circle2 = Circle.new(Position.new(100,0), 100)
    expect(circle1.distance_to(circle2)).to eq(-100)

    circle2 = Circle.new(Position.new(200,0),0)
    expect(circle1.distance_to(circle2)).to eq(100)
  end
end
end
