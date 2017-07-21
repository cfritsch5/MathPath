json.units do
  @units.each{|unit| json.set! unit.id, unit}
end
