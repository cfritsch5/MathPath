require_relative 'constant'

module Operator
  def initialize(*children)
    children.map {|child| child.class == Fixnum ? Constant.new(child) : child}
    super
  end

  def add_child(child)
     child = Constant.new(child) if child.class == Fixnum
     super
  end

  def reducable?
    children.all? { |e| e.class == Constant }
  end

  def simplify
    # binding.pry
    unless reducable?
      children.each do |child|
        child.simplify if child.class.ancestors.include?(Operator)
      end
    end
    operate
  end
end
