require './cell.rb'
require './map.rb'
require './view.rb'

class GameController

  def initialize
    @view = View.new
    @map = [
      [Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false)],
      [Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    ]
    @map_service = MapService.new(@map)
    @step_results = {}
  end

  def start
    loop do
      @step_result = @map_service.step
      if valid?
        render step_result
      else
        render 'stop'
        break
      end
    end
  end

  def render(data)
    @view.render(data)
  end

end
