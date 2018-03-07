require_relative 'scaling'
require_relative 'multiplication'
require_relative 'constant'

class Division < Scaling
  include NonCommutative

  def inverse
    #expect to have only one child when applying the inverse
    Multiplication.new(right || left)
  end

  def operate
    divide
  end

  def divide
    return nil unless reducable?
    result = left.value / right.value
    result = Constant.new(result)
    result.parent = parent
    parent.replace_child(self, result) if parent
    result
  end
end
