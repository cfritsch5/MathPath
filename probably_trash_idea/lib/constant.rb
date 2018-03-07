require_relative 'number'

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
  # def + (const)
  #   self.value += const.value
  # end
  #
  # def * (const)
  #   self.value *= const.value
  # end
  #
  # def - (const)
  #   arithmatic(:-,const)
  # end
end
