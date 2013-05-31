
class Material

   attr_accessor :color, :ambient, :diffuse, :reflection, :phong_exponent, :light

   def initialize(color, options={})
      @color          = color
      @ambient        = options.fetch(:ambient, 0.0)
      @diffuse        = options.fetch(:diffuse, 0.8)
      @reflection     = options.fetch(:reflection, 0.0)
      @phong_exponent = options.fetch(:phong_exponent, 50.0)
      @light          = options.fetch(:light, false)
   end

   FlatWhite = new(Color::White, ambient: 1.0, diffuse: 0.0, phong_exponent: 0.0).freeze
   FlatBlack = new(Color::Black, ambient: 1.0, diffuse: 0.0, phong_exponent: 0.0).freeze

   alias :light? :light

   def specular
      1 - diffuse
   end
end