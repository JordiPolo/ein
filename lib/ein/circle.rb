###################
# Our obstacles are circles, but other shapes may come later
###################
module Ein
  class Circle

    attr_reader :position, :radius

    def initialize(position, radius)
      @position, @radius = position, radius
    end

    def pos
      @position.round
    end

    def distance_to(object)
      case object_physics(object)
      when :circle
        @position.distance_to(object.pos) - ( @radius + object.radius)
      when :position
        @position.distance_to(object) - ( @radius )
      else
        raise "can not calculate distance from Circle to #{object.class}"
      end
    end

    private
    def object_physics(object)
      if object.respond_to?(:physical_shape)
        object.physical_shape
      else
        object.class.to_s.split('::').last.downcase.to_sym
      end
    end

  end
end
