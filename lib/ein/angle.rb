################
# A class with convenience method related to angles
##########
module Ein
  class Angle
    def self.degrees_to_radians(degrees)
      degrees * Math::PI / 180
    end
  end
end
