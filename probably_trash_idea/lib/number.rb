require_relative 'node'

class Number < Node
  attr_reader :value

  def initialize(value)
    super()
    @children = nil
    @value = value
    @order = 5
  end
end
