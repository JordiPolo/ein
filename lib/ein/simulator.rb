##############################
#
#This class is the highest level entity, controls how
#the simulation behaves, contains the world and the entities
#
###############################
module Ein
  class Simulator
    attr_reader :world, :current_time

    def initialize
      @current_time = Time.now
      @world = World.new
      @running = false
    end

    #TODO: should these methods add ! because they modify the simulation ?
    def start
      @running = true
      Thread.abort_on_exception = true
      Thread.new { run }
      self
    end

    def stop
      @running = false
      self
    end

    def running?
      @running
    end

    private

    STEP = 0.01

    def run
      LOGGER.info "Simulation started"
      while (@running)
        @current_time += STEP
        @world.step(STEP)
        sleep(STEP)
      end
      LOGGER.info "Simulation terminated"
    end

  end
end
