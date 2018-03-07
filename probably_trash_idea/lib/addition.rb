# require_relative 'node'
require_relative 'counter'
require_relative 'subtraction'
require_relative 'constant'

class Addition < Counter
  def add
    return nil unless reducable?
    result = children.reduce(0) {|acc, el| acc += el.value}
    result = Constant.new(result)
    # result.parent = parent
    parent.replace_child(self, result) if parent
    result
  end

  def operate
    add
  end

  def inverse
    Subtraction.new(right: children[0])
  end
end
