require './cell.rb'
require './map_service.rb'
require './view.rb'

class GameController

  def initialize
    @view = View.new
    # @map = [
    #   [Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false)],
    #   [Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    # ]

    # stable
    # @map = [
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    # ]

    # infinite
    @map = [
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
      [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    ]

    # cycle
    # @map = [
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    #   [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
    # ]

    @map_service = MapService.new(@map)
    @step_results = {}
  end

  def start
    loop do
      @step_result = @map_service.step
      render @step_result
      # sleep 3
    end
  end

  def render(data)
    @view.render(data)
  end

end
