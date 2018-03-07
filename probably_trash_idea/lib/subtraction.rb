require_relative 'noncommutative'
require_relative 'addition'

class Subtraction < Counter
  include NonCommutative

  def subtract
    return nil unless reducable?
    result = left.value - right.value
    result = Constant.new(result)
    result.parent = parent
    parent.replace_child(self, result) if parent
    result
  end

  def operate
    subtract
  end

  def inverse
    #assumes one child from popped
    Addition.new(left || right)
  end
end
