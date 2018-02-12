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

module BinaryOperator
  def initialize(child1 = nil, child2 = nil)
    super()
    add_child(child1) unless child1.nil?
    add_child(child2) unless child2.nil?
  end

  def add_child(child)
    # p self
    # @children = @children || []
    # p @children
    if children.count >= 2
      print 'Binary operator too many arguments error'
      raise 'BOE'
    else
      super(child)
      child.parent = self
    end
    true
  end
end

class Equality < Node
  include BinaryOperator

  def initialize
    super
    @order = 0
  end
end

class Counter < Node
  attr_accessor :parent
  def initialize
    super
    @order = 4
  end

  def reducable?
    children.all? { |e| e.class == Constant }
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
  include BinaryOperator

  def add
    return nil unless reducable?
    result = Constant.new(children.reduce(:+))
    parent.replace_child(self, result) if parent
    result
  end
  #
  # def opperate
  #   add
  # end
end

class Substraction < Counter
  include BinaryOperator
  # Subtraction: Minuend - Subtrahend = Difference.
  def subtract
    if reducable?
      result = Constant.new(children.reduce(:-))
      parent.replace_child(self, result)
    end
  end
end

class Scaling < Node
  def initialize
    super
    @order = 3
  end
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

  def + (const)
    value + const.value
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

def equation_builder(equation_string)
  #basically a heap based on order
  # numbers = (0..9).to_a
  # letters = ('a'..'z').to_a.concat('A'..'Z').to_a
  # 3 * x + 7 = 10
  #
  # if last char was number & next char is letter -> multiply
  # set node = highest order presednet
  #
  stack = []
  # equation_string.chars.each do |char|
  # obj = 3
  # next_token = *
  # create multiplication object set 1st child to last token
  # obj =  multiplication object
  # next_token = x
  # create variable and set as 2nd child of multiplication
  # if next token is parentheses call equation builder on the insides of the parentheses
  tokens = equation_string.chars
  # obj = nil
  last_token = nil
  until tokens.empty?
    next_token = tokens.shift
    print 'next',next_token.class
    puts
    print 'last',last_token.class
    puts
    case next_token
    when /[[:digit:]]/
      puts 'dig'
      next_token = eval(next_token)
      if last_token.is_a? Constant
        p next_token = next_token + last_token.value * 10
      end
      next_token = Constant.new(next_token)
    when /[[:alpha:]]/
      # when /[[:punct:]]/
        # puts 'punc'
      puts 'var'
      next_token = Variable.new(next_token.to_sym)
    when /\+/
      puts 'ad'
      next_token = Addition.new(last_token)
    when /\*/
      puts 'm'
      next_token = Multiplication.new(last_token)
    when /\=/
      puts 'eq'
      next_token = Equality.new
    end
    p last_token.order if last_token && last_token.order
    p next_token.order if next_token && next_token.order

    last_token = next_token
  end
  #   if obj.ancestors.include(BinaryOperator) && next_token
  #
end
