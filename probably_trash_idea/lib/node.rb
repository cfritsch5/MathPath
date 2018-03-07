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
    new_child.parent = self
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
      toprint = current_level.map do |e|
        if e.parent.class == Subtraction || e.parent.class == Division
          side = 'left:' if e.parent.left == e
          side = 'right:' if e.parent.right == e
        end
        print_me = "#{e.parent.class.to_s[0]}>#{side}"

        if e.class.ancestors.include?(Number)
          print_me += "#{e.class}(#{e.value})"
        else
          print_me += "#{e.class.to_s}"
        end
        print_me
      end
      puts toprint.join(" ")
    end
  end
end
