
class SimpleRenderer
   attr_accessor :scene
   attr_accessor :eye
   attr_accessor :background_color
   attr_accessor :up_vector
   attr_accessor :raytrace_depth
   attr_accessor :pixel_size

   def initialize(options={})
      @background_color = Color::Black
      @up_vector = Vector3::PlusZ
      @raytrace_depth = 5
      @pixel_size = 2
   end

   def w_vector
      eye.direction
   end

   def u_vector
      w_vector ^ up_vector
   end

   def v_vector
      w_vector ^ u_vector
   end

   def render(canvas)
   end
end