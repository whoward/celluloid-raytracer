
class RayHit < Struct.new(:primitive, :point, :type)

   def distance
      type.distance
   end
end