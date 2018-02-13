require 'topological_math'

describe Node do
  before do
    @node = Node.new
  end
  it 'returns a node object' do
    expect(@node).to be_a(Node)
   end
   it 'has an id' do
     expect(@node.id).to be_a(Fixnum)
   end
end

describe Constant do
  before do
    @const1 = Constant.new(3)
    @const2 = Constant.new(4)
  end
  it 'creates constant objects' do
    expect(@const1.value).to equal(3)
  end

  it 'can add constants' do
    newVal = @const1 + @const2
    expect(newVal).to equal(7)
    expect(@const1.value).to equal(7)
    expect(@const2.value).to equal(4)
  end

  it 'can multiply constants' do
    newVal = @const1 * @const2
    expect(newVal).to equal(12)
  end
end

describe Variable do
  before do
    @var = Variable.new(:x)
  end
  it 'creates a new variable object' do
    expect(@var).to be_a(Variable)
  end
end

describe Addition do
  before do
    @const1 = Constant.new(3)
    @const2 = Constant.new(4)
    @add = Addition.new
  end
  it 'creates a new addition object' do
    expect(@add).to be_a(Addition)
  end

  it 'can be initialized with children' do
    addObj = Addition.new(@const1,@const2)
    expect(addObj).to be_a(Addition)
    expect(addObj.children.length).to equal(2)
  end

  it 'adds child' do
    @add.add_child(@const1)
    expect(@add.children.length).to equal(1)
  end
end

describe Multiplication do
  before do
    @const1 = Constant.new(3)
    @const2 = Constant.new(4)
    end
  it 'creates new multiplication object' do
    mult = Multiplication.new
    expect(mult).to be_a(Multiplication)
  end
  it 'initializes with children' do
    mult = Multiplication.new(@const1,@const2)
    expect(mult).to be_a(Multiplication)
  end
end

describe 'equation_builder' do
  before do
    @eq = Equation.new
  end
  it 'returns Equation Object' do
    expect(Equation.equation_builder('7')).to be_a(Equation)
  end
  it 'makes correct objects' do
    # right now it returns the nodes hash so work with me
    expect(Equation.equation_builder('7').nodes.values[0]).to be_a(Constant)
    expect(Equation.equation_builder('x').nodes.values[0]).to be_a(Variable)
    expect(Equation.equation_builder('+').nodes.values[0]).to be_a(Addition)
    expect(Equation.equation_builder('*').nodes.values[0]).to be_a(Multiplication)
    expect(Equation.equation_builder('=').nodes.values[0]).to be_a(Equality)
  end
end
