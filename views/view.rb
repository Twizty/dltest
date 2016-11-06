require 'curses'
include Curses

class View

  def initialize
    Curses.init_screen
    Curses.start_color
    Curses.init_pair(COLOR_BLUE,COLOR_BLUE,COLOR_BLACK) 
    Curses.init_pair(COLOR_RED,COLOR_RED,COLOR_BLACK)
  end

  def render(data)
    begin
      Curses.setpos(0, 0)
      data.each do |row|
        row.each do |cell|
          if cell.alive?
            Curses.attron(color_pair(COLOR_RED)) {
              Curses.addstr '● '
            }
          else
            Curses.addstr '● '
          end
        end
        Curses.addstr "\n"
      end

      yield
    ensure
      Curses.close_screen
    end
  end
end
