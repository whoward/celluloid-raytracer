require 'vector'

class Color < Vector3
   Red   = new(1.0, 0.0, 0.0).freeze
   Green = new(0.0, 1.0, 0.0).freeze
   Blue  = new(0.0, 0.0, 1.0).freeze
   
   White = new(1.0, 1.0, 1.0).freeze
   Black = new(0.0, 0.0, 0.0).freeze

   alias :red :x
   alias :green :y
   alias :blue :z
end