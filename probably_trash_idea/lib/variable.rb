require_relative 'number'

class Variable < Number
  def initialize(value)
    value = value.to_sym if value.class != Symbol
    super(value)
  end
end
