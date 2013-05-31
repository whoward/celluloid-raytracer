
class Intersection < Struct.new(:type, :distance)
   None = new(:none, nil).freeze
   Inside = new(:inside, 0.0).freeze

   def self.hit(distance)
      new(:hit, distance)
   end

   def hit?
      type == :hit
   end

   def miss?
      type == :none
   end

   def inside?
      type == :inside
   end
end