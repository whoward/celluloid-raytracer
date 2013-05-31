
class Plane

   attr_accessor :normal, :distance, :material

   def initialize(normal, distance, material)
      @normal = normal
      @distance = distance
      @material = material
   end

   def normal_at(point)
      normal
   end

   def intersection_with(ray)
      theta = normal.dot_product(ray.direction)

      # if the angle is 0 degrees this means that the ray and plane are 
      # parallel and will never intersect
      return Intersection::None if theta == 0.0

      # calculate the distance between the ray and the plane
      dist = (distance - ray.origin.dot_product(normal)) / theta
      
      # if there is a positive distance then the ray will intersect, otherwise
      # it will miss.
      if dist > 0
         Intersection.hit(dist)
      else
         Intersection::None
      end
   end
end