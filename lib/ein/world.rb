##############################
#
#  This class represents the virtual world our simulation runs in
#
##############################
module Ein
  class World

    def initialize
      @entities = []
      read_world
      self
    end

    def render
      world_ui = {}
      world_ui['boundaries'] = @boundaries
      world_ui['obstacles'] = @obstacles
      @entities.each do |entity|
        if entity.respond_to?(:render)
          world_ui['entity'] = entity.render
        end
      end
      world_ui.to_json
    end

    def spawn(*entities)
      entities.each do |entity|
        @entities.push(entity)
      end
    end

    def step (time_step)
      @entities.each do |entity|
        entity.step(time_step)
        if collision_with?(entity)
          entity.step_back
        end
      end
    end


    def collision_with?(object)

      @boundaries.each do |boundary|
        return true if boundary.distance_to(object) <= 0
      end

      @obstacles.each do |obstacle|
        return true if obstacle.distance_to(object) <= 0
      end
      false
    end

    private

    def read_world
      #TODO: read from external .yml or something
      #TODO: mass and shape for the obstacles
      #boundaries from left boundary clockwise.
      @boundaries = [
        Plane.new(Vector.new(1,0), 1000),
        Plane.new(Vector.new(0,-1), 800),
        Plane.new(Vector.new(-1,0), 1000),
        Plane.new(Vector.new(0,1), 800)
      ]
      @obstacles = [
        Circle.new(Position.new(0,500), 20),
        Circle.new(Position.new(300,0), 20),
        Circle.new(Position.new(-900,-700), 10)
      ]
    end

  end
end
