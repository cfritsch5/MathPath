require_relative 'node'
require_relative 'constant'

class Scaling < Node
  include Operator

  def initialize(*children)
    super(*children)
    @order = 3
  end

  def scale
    return nil unless reducable?
    result = Constant.new(children.reduce(1) {|acc,el| acc * el.value})
    parent.replace_child(self, result) if parent
    result
  end
end
