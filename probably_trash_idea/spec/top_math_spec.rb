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

describe Operator do
  class DummyClass < Node
    include Operator
  end

  before(:each) do
    @dummy_class = DummyClass.new
  end

  it "converts child fixnum to constant" do
    @dummy_class.add_child(7)
    expect(@dummy_class.children.all? {|ch| ch.class == Constant}).to be(true)
  end
end

describe Counter do
end

describe Scaling do
end

describe Number do
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
    expect(@add.children[0].parent).to equal(@add)
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

describe Division do
  before do
    @div = Division.new
  end
  it 'creates blank object' do
    expect(@div).to be_a(Division)
    expect(@div.children.length).to equal(0)
  end

  it 'can initialize with arguments' do
    @div = Division.new(denom:8,nume:4)
    # expect(Division.new(denom:8,nume:4)).to_not raise_error
    expect(@div.denom.value).to be(8)
    expect(@div.nume.value).to be(4)
  end

  it 'adds denominator' do
    @div.add_child(denom: 7)
    expect(@div.denom.value).to equal(7)
  end

  it 'adds numerator' do
    @div.add_child(nume: 8)
    expect(@div.nume.value).to equal(8)
  end
end

describe Expression do
  it 'returns Expression Object' do
    expect(Expression.new('7')).to be_a(Expression)
  end
  it 'makes correct objects' do
    expect(Expression.new('7').root).to be_a(Constant)
    expect(Expression.new('x').root).to be_a(Variable)
    expect(Expression.new('1+2').root).to be_a(Addition)
    expect(Expression.new('1-2').root).to be_a(Subtraction)
    expect(Expression.new('1*2').root).to be_a(Multiplication)
    expect(Expression.new('1/2').root).to be_a(Division)
    expect(Expression.new('(1/2)').root).to be_a(Division)
  end

  it 'parses 1+1 into tree correctly' do
    @eq = Expression.new('1+1')
    expect(@eq.root.children[0]).to be_a(Constant)
    expect(@eq.root.children[1]).to be_a(Constant)
  end
  it 'parses 1/2 into tree correctly' do
    @eq = Expression.new('1/2')
    expect(@eq.root.children[0]).to be_a(Constant)
    expect(@eq.root.denom.value).to equal(2)
    expect(@eq.root.nume.value).to equal(1)
  end
  it 'parses 1+2/3 into tree correctly' do
    @eq = Expression.new('1+2/3')
    expect(@eq.root).to be_a(Addition)
  end
  it 'parses 1*2+3 into tree correctly' do
    @eq = Expression.new('1*2+3')
    expect(@eq.root).to be_a(Addition)
  end
  it 'parses 1*(2+3) into tree correctly' do
    @eq = Expression.new('1*(2+3)')
    expect(@eq.root).to be_a(Multiplication)
  end
  it 'parses (1/2)*3 into tree correctly' do
    @eq = Expression.new('(1/2)*3')
    expect(@eq.root).to be_a(Multiplication)
  end
end
