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
  def initialize(*children)
    children.each {|child| Constant.new(child) if child.class == Fixnum}
    super()
    children.each {|child| add_child(child)}
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
end

class Division < Scaling
  def initialize(divisor: nil, numerator: nil)
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

puts "reloaded #{Time.now}"

#
# Pry::Commands.block_command "reload", "reloads file on call" do |script_name|
#   load script_name
# end

#  order => Eq = 0, P = 1, Ex = 2, MD = 3, AS = 4, N = 5

class Expression
  attr_accessor :nodes, :root, :variables
  def initialize(equation_string)
    @nodes = {}
    @root = nil
    @variables = Hash.new {|h,k| h[k] = []}
    equation_builder(equation_string)
  end

  def pp
    @root.pp
  end

  def path_to_root(var)
    node = @variables[var][0]
    path = []
    until node.parent == nil
      path << node.parent
      node = node.parent
    end
    path
  end

  def undo_operation
  end
  # equal_idx = index_of_equals(tokens)
  # left = equal_idx ? tokens.take(equal_idx) : tokens
  # right = equal_idx ? tokens.drop(equal_idx+1) : tokens

  def equation_builder(equation_string)
    # tokens = equation_string.chars
    #basically a heap based on order
    tree_maker(equation_string.chars)
    # nodes[next_token.id] = next_token
  end

  def index_of_equals(equation_string)
    equation_string.index('=')
  end

  def createWrapperObject(token)
    case token
    when /[[:digit:]]/ then token = Constant.new(eval(token))
      # will need to take care of multi digit numbers later
      # kind of assuming only integers for now
    when /[[:alpha:]]/ then token = Variable.new(token)
    when /\+/ then token = Addition.new
    when /\*/ then token = Multiplication.new
    when /\=/ then token = Equality.new
    end
    token
  end

  def tree_maker(tokens, eq = nil)
    operators = []
    out = []
    order = { '+' => 1, '*' => 2 }
    obj = nil

    until tokens.empty?
      obj = nil
      next_token = tokens.shift
      if next_token.match(/[[:digit:]]|[[:alpha:]]/)
        # while tokens.first.match(/[[:digit:]]/)
        #   next_token += tokens.shift
        # end
        obj = wrap_and_add(next_token)
        @variables[obj.value] << obj if obj.class == Variable
        out << obj
        p obj.nil?
      elsif next_token.match(/\*|\+|\-|\/|\^/)
        if !operators.last || order[operators.last] < order[next_token]
          operators << next_token
        else
          until operators.empty? || order[operators.last] < order[next_token]
            obj = wrap_and_add(operators.pop, out.pop, out.pop)
            out << obj
          end
          operators << next_token
        end
      end
      # p 'loop??',obj
      # if obj.nil?
      #   operators << next_token
      # else
      #   out << obj
      # end
      # operators << next_token if obj.nil?
      # out << obj unless obj.nil?
    end
    until operators.empty?
      obj = wrap_and_add(operators.pop,out.pop,out.pop)
      out << obj
    end
    # puts operators,out
    @root = out[0]
  end

  def wrap_and_add(obj, child1 = nil, child2 = nil)
    obj = createWrapperObject(obj)
    @nodes[obj.id] = obj
    obj.add_child(child1) unless child1.nil?
    obj.add_child(child2) unless child2.nil?
    obj
  end
end
