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

  it '#inverse returns subtraction' do
    a = Addition.new(9)
    s = a.inverse
    expect(s).to be_a(Subtraction)
    expect(s.left).to be(nil)
    expect(s.right).to be_a(Constant)
  end
end

describe Subtraction do
  it 'creates new Subtraction object' do
    expect(Subtraction.new).to be_a(Subtraction)
  end

  it 'adds minuend' do
    obj = Subtraction.new
    obj.add_child(left: 7)
    expect(obj.left.value).to equal(7)
  end

  it 'adds subtrahend' do
    obj = Subtraction.new
    obj.add_child(right: 8)
    expect(obj.right.value).to equal(8)
  end

  it 'can be initialized with children' do
    obj = Subtraction.new(left:2,right:1)
    expect(obj).to be_a(Subtraction)
    expect(obj.children.length).to equal(2)
  end

  it '#inverse returns Addition' do
    s = Subtraction.new(left:9)
    a = s.inverse
    expect(a).to be_a(Addition)
    expect(a.children).to include(Constant)
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
  it 'inverse returns division'do
    m = Multiplication.new(1)
    d = m.inverse
    expect(d).to be_a Division
    expect(d.right.value).to be(1)
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
    @div = Division.new(right:8,left:4)
    # expect(Division.new(right:8,left:4)).to_not raise_error
    expect(@div.right.value).to be(8)
    expect(@div.left.value).to be(4)
  end
  it 'adds denominator' do
    @div.add_child(right: 7)
    expect(@div.right.value).to equal(7)
  end
  it 'adds numerator' do
    @div.add_child(left: 8)
    expect(@div.left.value).to equal(8)
  end
  it 'inverse returns multiplication'do
    d = Division.new(left:1,right:2)
    m = d.inverse
    expect(m).to be_a Multiplication
    expect(m.children[0].value).to be(2)
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

  it 'parses Addition 1+1 into tree correctly' do
    @eq = Expression.new('1+1')
    expect(@eq.root).to be_a(Addition)
    expect(@eq.root.children).to all(be_a(Constant))
  end
  it 'parses Subtraction 2-1 into tree correctly' do
    @eq = Expression.new('2-1')
    expect(@eq.root).to be_a(Subtraction)
    expect(@eq.root.children).to all(be_a(Constant))
    expect(@eq.root.left.value).to equal(2)
    expect(@eq.root.right.value).to equal(1)
  end
  it 'parses Multiplication 1*1 into tree correctly' do
    @eq = Expression.new('1*1')
    expect(@eq.root).to be_a(Multiplication)
    expect(@eq.root.children).to all(be_a(Constant))
  end
  it 'parses Division 1/2 into tree correctly' do
    @eq = Expression.new('1/2')
    expect(@eq.root).to be_a(Division)
    expect(@eq.root.children).to all(be_a(Constant))
    expect(@eq.root.right.value).to equal(2)
    expect(@eq.root.left.value).to equal(1)
  end
  it 'nests sub operations into tree correctly' do
    @eq = Expression.new('1+2/3')
    expect(@eq.root).to be_a(Addition)
    expect(@eq.root.children).to include(Division && Constant)
  end
  it 'parses according to order of operations' do
    @eq = Expression.new('1*2+3')
    expect(@eq.root).to be_a(Addition)
    expect(@eq.root.children).to include(Multiplication && Constant)
  end
  it 'parses parentheses into tree correctly' do
    @eq = Expression.new('1*(2+3)')
    expect(@eq.root).to be_a(Multiplication)
    expect(@eq.root.children).to include(Addition && Constant)
    kids2 = @eq.root.children.map do |child|
      child.children.map(&:class) unless child.class.ancestors.include? Number
    end
    kids2.flatten!
    kids2.compact!
    expect(kids2).to eq([Constant, Constant])
    @eq = Expression.new('(1/2)*3')
    expect(@eq.root).to be_a(Multiplication)
    expect(@eq.root.children).to include(Division && Constant)
    kids2 = @eq.root.children.map do |child|
      child.children.map(&:class) unless child.class.ancestors.include? Number
    end
    kids2.flatten!
    kids2.compact!
    expect(kids2).to eq([Constant, Constant])
  end

  context '#pop' do
    let(:e) {Expression.new('7*(3*x+5)')}
    it '#path_to_root helper returns an array of the nodes in the root' do
      expect(e.path_to_root(:x).map(&:class)).to eq([Variable, Multiplication, Addition, Multiplication])
    end
    it 'returns topmost operation' do
      expect(e.pop(:x)).to be_a(Multiplication)
    end
    it 'sets root to the next child in the var path' do
      expect(e.pop(:x)).to be_a(Multiplication)
      expect(e.root).to be_a(Addition)
    end
  end

  context '#push' do
    let(:e) {Expression.new('3*x')}
    let(:a) {Addition.new(7)}
    let(:s) {Subtraction.new(right: 7)}
    let(:d) {Division.new(right: 7)}
    let(:m) {Multiplication.new(7)}
    it 'pushes addition' do
      e.push(a)
      expect(e.root).to be_a(Addition)
      expect(e.root.children).to include(Constant && Multiplication)
    end
    it 'pushes multiplication' do
      e.push(m)
      expect(e.root).to be_a(Multiplication)
      expect(e.root.children).to include(Constant && Multiplication)
    end
    it 'pushes subtraction' do
      e.push(s)
      expect(e.root).to be_a(Subtraction)
      expect(e.root.children).to include(Constant && Multiplication)
    end
    it 'pushes division' do
      e.push(d)
      expect(e.root).to be_a(Division)
      expect(e.root.children).to include(Constant && Multiplication)
    end
  end
end

describe Equation do
  let(:e) {Equation.new('2+x=3')}
  it 'initializes' do
    expect(e).to be_a Equation
  end
  it 'creates left expression' do
    expect(e.left).to be_a Expression
    expect(e.left.root).to be_a Addition
    expect(e.left.root.children).to include(Constant && Variable)
  end
  it 'creates right expression' do
    expect(e.right).to be_a Expression
    expect(e.right.root).to be_a Constant
  end
end





#please stop jerking
