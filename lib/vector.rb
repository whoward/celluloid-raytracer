
class Vector3
   attr_accessor :x, :y, :z

   def initialize(x, y, z)
      @x = x
      @y = y
      @z = z
   end

   Origin = new(0.0, 0.0, 0.0).freeze

   PlusX  = new(1.0, 0.0, 0.0).freeze
   MinusX = new(-1.0, 0.0, 0.0).freeze
   PlusY  = new(0.0, 1.0, 0.0).freeze
   MinusY = new(0.0, -1.0, 0.0).freeze
   PlusZ  = new(0.0, 0.0, 1.0).freeze
   MinusZ = new(0.0, 0.0, -1.0).freeze

   def ==(rhs)
      x == rhs.x && y == rhs.y && z == rhs.z
   end

   def +(rhs)
      self.class.new(x + rhs.x, y + rhs.y, z + rhs.z)
   end

   def -(rhs)
      self.class.new(x - rhs.x, y - rhs.y, z - rhs.z)
   end

   def *(rhs)
      case rhs
         when self.class then self.class.new(x * rhs.x, y * rhs.y, z * rhs.z)
         when Fixnum, Float then self.class.new(x * rhs, y * rhs, z * rhs)
         else raise ArgumentError.new("unexpected input: #{rhs.inspect}")
      end
   end

   def cross_product(rhs)
      x = (self.y * rhs.z) - (self.z * rhs.y)
      y = (self.z * rhs.x) - (self.x * rhs.z)
      z = (self.x * rhs.y) - (self.y * rhs.x)

      self.class.new(x, y, z)
   end
   alias :'^' :cross_product

   def dot_product(rhs)
      x * rhs.x + y * rhs.y + z * rhs.z
   end

   def length
      Math.sqrt dot_product(self)
   end
   alias :magnitude :length

   def normalize
      len = self.magnitude

      if len > 0
         self * (1 / magnitude)
      else
         self.clone
      end
   end

   def normalize!
      len = self.magnitude

      return if len == 0
      
      self.x /= len
      self.y /= len
      self.z /= len
   end
end