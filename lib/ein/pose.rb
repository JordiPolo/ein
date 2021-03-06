################################
# Pose of an object in a 2D environment
# Its position in 2D coordinates and its angle in degrees
# angle=0 => +y, angle=90 => +x, angle=180 => -y, angle=270 => -x
################################
module Ein
  class Pose

    attr_reader :position

    def initialize(position, angle)
      @position = position
      @angle = angle
    end

    #Create a new pose, modifying previous with a relative position and angle
    def advance(distance, angle)
      new_angle = @angle + angle
      new_y = @position.y + distance * Math.cos(Angle.degrees_to_radians(new_angle))
      new_x = @position.x + distance * Math.sin(Angle.degrees_to_radians(new_angle))
      Pose.new(Position.new(new_x, new_y), new_angle)
    end

    def to_s
      "N: #@angle, #@position"
    end

  end
end
