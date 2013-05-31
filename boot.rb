$:.unshift File.expand_path("app", File.dirname(__FILE__))
$:.unshift File.expand_path("lib", File.dirname(__FILE__))

require 'vector'
require 'color'
require 'ray'
require 'ray_hit'
require 'intersection'
require 'material'
require 'simple_renderer'

require 'plane'
require 'sphere'

require 'simple_scene_manager'