# #helpful pry notes
# #in pry
# reload = Proc.new { load 'topological_math.rb'}
# #then every time just call
# reload.call
# #to reload the file
# #also nice to have
# puts "reloaded #{Time.now}"
# #in ruby script file to verify it is reloaded at that time
# require_relative 'pry'
# require_relative_relative 'node'
# require_relative_relative 'noncommutative'
# require_relative_relative 'operator'
# require_relative_relative 'counter'
require_relative 'addition'
require_relative 'subtraction'
# require_relative 'scaling'
require_relative 'multiplication'
require_relative 'division'
# require_relative 'number'
require_relative 'variable'
require_relative 'constant'




# puts "reloaded #{Time.now}"

class Expression
  Operators_Precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3, '(' => 4, ')' => 4 }

  attr_accessor :nodes, :root, :variables
  attr_reader :read
  def initialize(equation_string = nil)
    @nodes = {}
    @root = nil
    @variables = Hash.new {|h,k| h[k] = []}
    @root = expression_builder(equation_string) if equation_string
    @read = equation_string
  end

  def pp
    @root.pp
  end

  # def to_s
  #   @root.to_s
  # end

  def simplify
    @root = root.simplify
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
    binding.pry
    popped.remove_child(arm)
    popped
  end

  def push(node)
    #presumming node w/ one child
    if node.class == Subtraction || node.class == Division
      node.add_child(right: @root) if node.left
      node.add_child(left: @root) if node.right
    else
      node.add_child(@root)
    end
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
    when /\-/ then token = Subtraction.new(right: child1, left: child2)
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


class Equation
  attr_accessor :left, :right
  def initialize(equation_string)
    equation_builder(equation_string)
  end

  def equation_builder(equation_string)
    equal_idx = index_of_equals(equation_string)
    left = equal_idx ? equation_string[0...equal_idx] : equation_string
    right = equal_idx ? equation_string[equal_idx+1 .. -1] : nil
    @left = Expression.new(left)
    @right = Expression.new(right)
  end

  def index_of_equals(equation_string)
    equation_string.index('=')
  end

  def pp
    left.pp
    puts "="
    right.pp
  end

  def solve
    #assumes 1st order equation with var on left
    isolate_var_left
    right.simplify
    [left.root.value,right.root.value]
  end

  def isolate_var_left
    var = @left.variables.values[0][0]
    sym = @left.variables.keys[0]
    while left.root != var
      op = left.pop(sym)
      #the time of pop is not very good have to rerecurse every time in sub method to get path to var
      op = op.inverse
      right.push(op)
    end
  end
end
