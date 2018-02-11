# #helpful pry notes
# #in pry
# reload = Proc.new { load 'topological_math.rb'}
# #then every time just call
# reload.call
# #to reload the file
# #also nice to have
# puts "reloaded #{Time.now}"
# #in ruby script file to verify it is reloaded at that time


class Node
  attr_accessor :parent, :children

  def initialize
    @parent = nil
    @children = []
    #thinking about making children a hashmap to add and delete individual children
    #ie replacing an addition child with the result of the addition
    #also maybe add a unique id and store the id in children rather than a reference to the next node???
    puts "node: #{self}"
  end

  def to_s
    if @children

      children = @children.map {|child|  child.class}.join(", ")
      "node => #{self.class}, children => [#{children}]"
    else
      "#{self.class}"
    end
  end
end

module BinaryOperator
  def add_child(child)
    # p self
    @children = @children || []
    # p @children
    if @children.count >= 2
      print "Binary operator too many arguments error"
      raise "BOE"
    else
      @children << child
      child.parent = self
    end
    true
  end
end

class Equality < Node
  include BinaryOperator
end

class Counter < Node
  attr_accessor :parent
end

class Addition < Counter
  include BinaryOperator
  def initialize(child1 = nil, child2 = nil)
    if child1
      add_child(child1)
      if child2
        add_child(child2)
        # super()
      end
    end
  end

  def add
    if children.all? { |e| e.class == Constant }
      p true;
      #replace parents child with new constant that is the combo of the two numbers
      # need method to remove this child from parent & replace with new child
      p self.parent.children = Constant.new( children.reduce(:+))
    end
  end
end

class Substraction < Counter
end

class Scaling < Node
end

class Multiplication < Scaling
  include BinaryOperator
end

class Division < Scaling
end

class Number < Node
  attr_reader :value
  def initialize(value)
    super()
    @children = nil
    @value = value
  end
end

class Variable < Number
  def initialize(value)
    if value.class == Symbol
      super(value)
    else
      raise "variables should be a symbols"
    end
  end
end

class Constant < Number
  attr_accessor :value
  def initialize(value)
    if value.class == Fixnum
      super(value)
    else
      raise "not a number"
    end
  end

  # def add (sym, const)
  #   if const.class == Constant
  #     @value = [self.value, const.value].reduce(sym)
  #   else
  #     raise "constants can only be added to constants"
  #   end
  # end

  def + (const)
    self.value + const.value
  end
  #
  # def - (const)
  #   arithmatic(:-,const)
  # end
end

puts "reloaded #{Time.now}"
