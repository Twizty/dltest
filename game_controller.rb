require './cell.rb'
require './map_service.rb'
require './view.rb'

class GameController

  def initialize(initial_condition_path)
    @map = []
    File.readlines(initial_condition_path).each do |line|
      @map << line.split(' ').map { |value| Cell.new(value) }
    end

    @view = View.new

    @map_service = MapService.new(@map)
    @step_results = {}
  end

  def start
    render @map
    loop do
      @step_result = @map_service.step
      render @step_result
    end
  end

  def render(data)
    @view.render(data)
  end

end
