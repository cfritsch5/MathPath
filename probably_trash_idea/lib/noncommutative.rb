require_relative 'constant'

module NonCommutative
  attr_accessor :right, :left

  def initialize(right: nil, left: nil, l: nil, r:nil)
    left = left || l  #just for shorthand typing
    right = right || r
    @right = nil
    @left = nil
    super()
    add_child(right: right) if right
    add_child(left: left) if left
  end

  def replace_child(old, new_child)
    @left = new_child if old == @left
    @right = new_child if old == @right
    super
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
end
