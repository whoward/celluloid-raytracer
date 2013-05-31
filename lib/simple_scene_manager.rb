
class SimpleSceneManager
   def add(primitive)
      primitives.push(primitive)
   end

   def raytrace(ray, options={})
      primitives.map do |primitive|
         intersect = primitive.intersection_with(ray)

         if intersect.hit? || intersect.inside?
            RayHit.new(primitive, ray.point_at_distance(intersect.distance), intersect)
         else
            nil
         end
      end.compact
   end

private

   def primitives
      @primitives ||= []
   end
end