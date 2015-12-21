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
      Curses.setpos(0, 0)  # column 6, row 3
      # Curses.addstr data.map { |row| "[#{row.map(&:state).join(', ')}]" }.join("\n")
      # Curses.attron(color_pair(COLOR_RED)|A_NORMAL) {
      #   Curses.addstr data.map { |row| row.map { |e| e.alive? ? '●'.colorize(:red) : '●' }.join(' ') }.join("\n")
      # }
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

      Curses.getch
    ensure
      Curses.close_screen
    end
    # Curses.init_screen
    # Curses.clear
    # Curses.setpos 6, 3
    # Curses.addstr data.map { |row| "[#{row.map(&:state).join(', ')}]" }.join("\n")
    # Curses.close_screen
  end
end
