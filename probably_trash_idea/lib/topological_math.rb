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
  attr_accessor :parent, :order, :id

  def initialize
    @parent = nil
    @children = {}
    @id = rand(10**9)
    @order = nil
    # replace w/ better id generator later - probably good enough for now
    # thinking about making children a hashmap to add and delete individual children
    # ie replacing an addition child with the result of the addition
    # also maybe add a unique id and store the id in children rather than a reference to the next node???
    # puts "node: #{self}"
  end

  def add_child(child)
    @children[child.id] = child
  end

  # def add_parent(parent)
  #   @parent = parent
  # end

  def replace_child(old, new_child)
    p 'self', self
    @children.delete(old.id)
    @children[new_child.id] = new_child
  end

  def children
    @children.values if @children
  end

  def to_s
    unless @children.keys.empty?

      children = @children.map(&:class).join(', ')
      "node => #{self.class}, children => [#{children}]"
    else
      self.class.to_s
    end
  end

  def find_root
    return self if parent.nil?
    parent.find_root
  end

  def pp
    pretty_print
  end

  def pretty_print
    root = find_root
    next_level = [root]

    until next_level.empty?
      current_level = next_level
      next_level = []
      current_level.each do |node|
        if node.children && !node.children.empty?
          next_level.concat(node.children)
        end
      end
      puts current_level.map {|e| e.class.to_s}.reduce {|a,e| a + " " + e}
    end

    # add all the children of current level nodes to the next level
    # print current level to names on same row
    # set current_level = next_level
    # and clear next_level
    # keep going as long as next level is not empty
    #
  end
end

module Operator
  def initialize(*kids)
    p kids
    kids.each {|kid| Constant.new(child1) if child1.class == Fixnum}
    super()
    kids.each {|kid| add_child(kid)}
  end
  # def initialize(child1 = nil, child2 = nil)
  #   child1 = Constant.new(child1) if child1.class == Fixnum
  #   child2 = Constant.new(child2) if child2.class == Fixnum
  #   super()
  #   add_child(child1) unless child1.nil?
  #   add_child(child2) unless child2.nil?
  # end

  def add_child(child)
    # p self
    # @children = @children || []
    # p @children
    # if children.count >= 2
    #   print 'Binary operator too many arguments error'
    #   raise 'BOE'
    # else
      super(child)
      child.parent = self
    # end
    # true
  end

  def reducable?
    children.all? { |e| e.class == Constant }
  end
end


class Equality < Node
  include Operator

  def initialize
    super
    @order = 0
  end
end

class Counter < Node
  include Operator

  attr_accessor :parent
  def initialize
    super
    @order = 4
  end

  # def reducable?
  #   children.all? do |e|
  #     return true if e.class == Constant
  #     return e.reducable? if e.class.ancestors.include?(Node) && e.children
  #     false
  #   end
  # end

end

class Addition < Counter
  def add
    return nil unless reducable?
    result = Constant.new(children.reduce(:+))
    parent.replace_child(self, result) if parent
    result
  end

  # def opperate
  #   add
  # end
end

class Substraction < Counter
  # Subtraction: Minuend - Subtrahend = Difference.
  def subtract
    if reducable?
      result = Constant.new(children.reduce(:-))
      parent.replace_child(self, result)
    end
  end
end

class Scaling < Node
  include Operator

  def initialize(children)
    super(children)
    @order = 3
  end

  def scale
    return nil unless reducable?
    result = Constant.new(children.reduce(1) {|acc,el| acc * el.value})
    parent.replace_child(self, result) if parent
    result
  end
end

class Multiplication < Scaling
  def multiply
    return nil unless reducable?
    result = Constant.new(children.reduce(1) {|acc,el| acc * el.value})
    parent.replace_child(self, result) if parent
    result
  end
end

class Division < Scaling
  def initialize(divisor: nil, numerator: nil)
    p 'div', divisor
    divisor = 1/divisor
    super
  end
end

class Number < Node
  attr_reader :value

  def initialize(value)
    super()
    @children = nil
    @value = value
    @order = 5
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
    return super(value) if value.class == Fixnum
    raise 'not a number'
  end

  # def add (sym, const)
  #   if const.class == Constant
  #     @value = [self.value, const.value].reduce(sym)
  #   else
  #     raise "constants can only be added to constants"
  #   end
  # end

  # unsure this is the right place to be handling this.
  def + (const)
    self.value += const.value
  end

  def * (const)
    self.value *= const.value
  end
  #
  # def - (const)
  #   arithmatic(:-,const)
  # end
end

puts "reloaded #{Time.now}"

#
# Pry::Commands.block_command "reload", "reloads file on call" do |script_name|
#   load script_name
# end

#  order => Eq = 0, P = 1, Ex = 2, MD = 3, AS = 4, N = 5

class Equation
  def initialize
    @nodes = {}
  end

  def self.equation_builder(equation_string)
    #basically a heap based on order
    nodes = {}
    tokens = equation_string.chars
    last_token = nil
    until tokens.empty?
      next_token = tokens.shift
      case next_token
      when /[[:digit:]]/
        puts 'dig'
        next_token = eval(next_token)
        if last_token.is_a? Constant
          p last_token = next_token + last_token * 10
          #replace last token with next token
        end
        next_token = Constant.new(next_token)
        next_token.parent = last_token if last_token
        last_token.add_child(next_token) if last_token
      when /[[:alpha:]]/ then next_token = Variable.new(next_token.to_sym)
      when /\+/ then next_token = Addition.new(last_token)
      when /\*/ then next_token = Multiplication.new(last_token)
      when /\=/ then next_token = Equality.new
      end
      nodes[next_token.id] = next_token
      last_token = next_token
    end
    nodes
  end

  def orderHeapify(last_token, next_token)
  end
end