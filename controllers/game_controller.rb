require './services/get_next_generation_service.rb'
require './services/input_reader_service.rb'
require './views/view.rb'

class GameController
  def initialize(initial_condition_path)
    @map  = InputReaderService.new(initial_condition_path).perform
    @view = View.new
  end

  def start
    render @map
    loop do
      @map = GetNextGenerationService.new(@map).perform
      render @map
    end
  end

  def render(data)
    @view.render(data) { Curses.getch }
  end
end
