require_relative 'node'
require_relative 'operator'

class Counter < Node
  include Operator

  attr_accessor :parent
  def initialize(*children)
    super
    @order = 4
  end

  # def recursive_reducable?
  #   children.all? do |e|
  #     return true if e.class == Constant
  #     return e.reducable? if e.class.ancestors.include?(Node) && e.children
  #     false
  #   end
  # end

end
