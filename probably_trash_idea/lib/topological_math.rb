# #helpful pry notes
# #in pry
# reload = Proc.new { load 'topological_math.rb'}
# #then every time just call
# reload.call
# #to reload the file
# #also nice to have
# puts "reloaded #{Time.now}"
# #in ruby script file to verify it is reloaded at that time
require 'pry'

class Node
  attr_accessor :parent, :order, :id

  def initialize(*children)
    @parent = nil
    @children = {}
    @id = rand(10**9)
    @order = nil
    # replace w/ better id generator later - probably good enough for now
    # thinking about making children a hashmap to add and delete individual children
    # ie replacing an addition child with the result of the addition
    # also maybe add a unique id and store the id in children rather than a reference to the next node???
    # puts "node: #{self}"
    children.each {|child| add_child(child)}
  end

  def add_child(child)
    @children[child.id] = child
    child.parent = self
  end

  def remove_child(child)
    @children.delete(child.id)
    child.parent = nil
    self
  end

  # def add_parent(parent)
  #   @parent = parent
  # end

  def replace_child(old, new_child)
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
      # puts current_level.map {|e| e.class.to_s}.reduce {|a,e| a + " " + e}
      toprint = current_level.map do |e|
        if e.class.ancestors.include?(Number)
          "#{e.parent.class.to_s[0]}>#{e.class}(#{e.value})"
        else
          "#{e.parent.class.to_s[0]}>#{e.class.to_s}"
        end
      end
      puts toprint.join(" ")
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

  def operate(&operation)
    return nil unless reducable?
    result = Constant.new(children.reduce(1) {|acc,el| operation.call(acc,el)})
    parent.replace_child(self, result) if parent
    result
  end
end


class Equality < Node
  # include Operator

  def initialize
    super
    @order = 0
  end
end

class Counter < Node
  include Operator

  attr_accessor :parent
  def initialize(*children)
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
    result.parent = parent
    parent.replace_child(self, result) if parent
  end
  #
  # def opperate
  #   opperate(@children) {|acc,el| acc + el}
  # end
end

class Subtraction < Counter
  # Subtraction: Minuend - Subtrahend = Difference
  attr_reader :subtr, :minu
  def initialize(minu: nil, subtr: nil )
    @minu = nil
    @subtr = nil
    super()
    add_child(minu: minu) if minu
    add_child(subtr: subtr) if subtr
  end

  def add_child(minu: nil, subtr: nil)
    child = minu || subtr
    child = Constant.new(child) if child.class == Fixnum
    @subtr = child if subtr
    @minu = child if minu
    super(child)
  end

  def subtract
    if reducable?
      result = Constant.new(children.reduce(:-))
      parent.replace_child(self, result)
    end
  end
end

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

class Multiplication < Scaling
  def multiply
    return nil unless reducable?
    result = Constant.new(children.reduce(1) {|acc,el| acc * el.value})
    parent.replace_child(self, result) if parent
    result
  end

  def inverse
    #again assuming we are applying the inverse with one child
    #cause thats what makes sense
    Division.new(right: children[0])
  end
end

class Division < Scaling
  attr_accessor :right, :left

  def initialize(right: nil, left: nil)
    @right = nil
    @left = nil
    super()
    add_child(right: right) if right
    add_child(left: left) if left
  end

# overwrite inherited add_child b/c need to assign to special references
  def add_child(*unspec, right: nil, left: nil)
    raise ArgumentError, 'right: or left: must be specified' if right.nil? && left.nil?
    child = right || left
    child = Constant.new(child) if child.class == Fixnum
    @left = child if left
    @right = child if right
    super(child)
  end

  def inverse
    #expect to have only one child when applying the inverse
    children = []
    children << right if right
    children << left if left
    Multiplication.new(*children)
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
    value = value.to_sym if value.class != Symbol
    super(value)
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

# puts "reloaded #{Time.now}"

class Equation < Node
  attr_accessor :nodes, :root, :variables
  def initialize(equation_string)
    super()
    @nodes = {}
    @root = nil
    @variables = Hash.new {|h,k| h[k] = []}
    equation_builder(equation_string)
  end

  def equation_builder(equation_string)
    equal_idx = index_of_equals(equation_string)
    left = equal_idx ? equation_string[0...equal_idx] : equation_string
    right = equal_idx ? equation_string[equal_idx+1 .. -1] : equation_string
    left = Expression.new(left)
    right = Expression.new(right)
    add_child(left)
    add_child(right)
  end

  def index_of_equals(equation_string)
    equation_string.index('=')
  end
end

class Expression < Node
  Operators_Precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3, '(' => 4, ')' => 4 }

  attr_accessor :nodes, :root, :variables
  attr_reader :read
  def initialize(equation_string = nil)
    super()
    @nodes = {}
    @root = nil
    @variables = Hash.new {|h,k| h[k] = []}
    @root = expression_builder(equation_string) if equation_string
    @read = equation_string
  end

  def pp
    @root.pp
  end

  def to_s
    @root.to_s
  end

  def path_to_root(var)
    node = @variables[var][0]
    path = [node]
    until node.parent == nil
      path << node.parent
      node = node.parent
    end
    path
  end

  def pop(var)
    path = path_to_root(var)
    popped = path.pop
    arm = popped.children.select {|el| el == path.last}[0]
    @root = arm
    popped.remove_child(arm)
    popped
  end

  def push(node)
    #presumming node w/ one child
    #works for multiplication and Addition
    #needs work to work for division
    node.add_child(@root)
    @root = node
  end


  def expression_builder(expression_string)
    tree_maker(expression_string.chars)
  end

  def createWrapperObject(token, child1, child2)
    case token
    when /[[:digit:]]/ then token = Constant.new(eval(token))
      # kind of assuming only integers for now
    when /[[:alpha:]]/ then token = Variable.new(token)
    when /\+/ then token = Addition.new(child1, child2)
    when /\-/ then token = Subtraction.new(subtr: child1, minu: child2)
    when /\*/ then token = Multiplication.new(child1, child2)
    when /\// then token = Division.new(right: child1, left: child2)
    # when /\(/ then token = Expression.new
    # when /\=/ then token = Equality.new
    end
    token
  end

  def tree_maker(tokens, eq = nil)
    operators = []; out = []; obj = nil;
    order = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3, '(' => 4, ')' => 4 }

    # binding.pry
    until tokens.empty?
      obj = nil
      next_token = tokens.shift
      if next_token.match(/[[:digit:]]|[[:alpha:]]/)
        while tokens.first && tokens.first.match(/[[:digit:]]/)
          next_token += tokens.shift
        end
        obj = wrap_and_add(next_token)
        out << obj
      elsif next_token.match(/\)/)
        until operators.empty? || operators.last == "("
          break if operators.last == "("
          obj = wrap_and_add(operators.pop, out.pop, out.pop)
          out << obj
        end
      else
          until operators.empty? || operators.last == "(" || order[operators.last] < order[next_token]
            obj = wrap_and_add(operators.pop, out.pop, out.pop)
            out << obj
          end
        operators << next_token
      end
    end

    until operators.empty?
      if operators.last == "("
        operators.pop
        next
      end
      obj = wrap_and_add(operators.pop,out.pop,out.pop)
      out << obj
    end

    out[0]
  end

  def wrap_and_add(obj, child1 = nil, child2 = nil)
    # p 'wrap', obj, child1, child2
    obj = createWrapperObject(obj, child1, child2)
    # p obj.class
    @variables[obj.value] << obj if obj.class == Variable
    @nodes[obj.id] = obj
    # obj.add_child(child1) unless child1.nil?
    # obj.add_child(child2) unless child2.nil?
    obj
  end
end
