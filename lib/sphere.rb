
class Sphere

   attr_accessor :origin, :radius, :material

   def initialize(origin, radius, material)
      @origin = origin
      @radius = radius
      @material = material
   end

   def contains?(point)
      (point - origin).magnitude <= radius
   end

   def normal_at(point)
      (point - origin).normalize
   end

   # from http://wiki.cgsociety.org/index.php/Ray_Sphere_Intersection
   # adapted for this project
   def intersection_with(ray)
      # quick test to check if the ray is inside the sphere
      return Intersection::Inside if contains?(ray.origin)
      
      o = ray.origin - origin

      # Calculate the discriminant (b^2 - 4ac)
      a = ray.direction.dot_product(ray.direction)
      b = 2 * ray.direction.dot_product(o)
      c = o.dot_product(o) - radius**2

      discriminant = b**2 - 4*a*c
      
      # Guard against imaginary numbers
      return Intersection::None if discriminant <= 0

      # Calculate the Q term
      discriminant = Math.sqrt(discriminant)

      if b < 0
         q = (-b - discriminant) / 2.0
      else
         q = (-b + discriminant) / 2.0
      end

      # Compute T1 an T2, making sure they are in ascending order
      t1, t2 = [(q / a), (c / q)].sort

      # If the further term is negative the sphere is not intersected at all
      return Intersection::None if t2 < 0

      # at this point we are certain t2 is positive or equal to zero
      # therefore if t1 is negative the closest intersection is t2, otherwise it is t1
      Intersection.hit(t1 < 0 ? t2 : t1)
   end

end