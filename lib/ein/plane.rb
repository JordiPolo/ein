#######################################
# This is an infinite 2D plane with infinite mass and infinitely strong
# Objects and entities can collide with it.
# normal is the normal of the plane towards the origin
# distance_to_origin is the distance from the plane to the origin
#######################################
module Ein
  class Plane
    attr_reader :normal, :distance_to_origin

    def initialize(normal, distance_to_origin)
      @normal = normal
      @distance_to_origin = distance_to_origin
    end

    def distance_to(object)
      case object_physics(object)
      when :circle
        distance_to_point(object.pos) - object.radius
      when :position
        distance_to_point(object)
      else
        raise "can not calculate distance from Plane to #{object.class}"
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

    def distance_to_point(point)
      projected_point = normal.project(point)
      projected_point.x + projected_point.y + @distance_to_origin
    end

  end
end
