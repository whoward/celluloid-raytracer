
class Ray < Struct.new(:origin, :direction)

   def point_at_distance(distance)
      #TODO: direction should be normalized at assignment time
      origin + (direction.normalize * distance)
   end
end