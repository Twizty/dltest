require './cell.rb'
require './map.rb'

map = [
  [Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false)],
  [Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false)],
  [Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
  [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
  [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
]

m = MapService.new(map)

m.print
puts ''

m.step
m.print
# m.step
# m.print
