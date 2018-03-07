require_relative 'scaling'
require_relative 'division'
require_relative 'constant'

class Multiplication < Scaling
  def multiply
    return nil unless reducable?
    result = Constant.new(children.reduce(1) {|acc,el| acc * el.value})
    parent.replace_child(self, result) if parent
    result
  end

  def operate
    multiply
  end

  def inverse
    #again assuming we are applying the inverse with one child
    #cause thats what makes sense
    Division.new(right: children[0])
  end

  def distribute(child_a) #distribute
    return nil unless child_b.ancestors.include?(Counter)
    into = children.select {|child| child != child_a}
    klass = into.class
    m1 = Multiplication.new(child_a,into.children[0])
    m2 = Multiplication.new(child_a,into.children[0])
    self.parent.replace_child(self,klass.new(m1, m2))
  end
end
