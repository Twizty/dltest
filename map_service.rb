class MapService
  LIFE_BIRTH_COUNT = 3
  LIFE_DEATH_UPPER_LIMIT = 3
  LIFE_DEATH_BOTTOM_LIMIT = 2

  class LifeEndsError < RuntimeError; end

  attr_reader :map

  def initialize(map)
    @map = map
  end

  def step
    kill = []
    liven_up = []

    @map.each_with_index do |row, i|
      row.each_with_index do |e, j|
        next_cells = next_to(i, j)
        alive_cells = next_cells.select(&:alive?)
        alive_cells_count = alive_cells.length

        liven_up << e if e.dead? && alive_cells_count == LIFE_BIRTH_COUNT
        kill << e if e.alive? && (alive_cells_count > LIFE_DEATH_UPPER_LIMIT || alive_cells_count < LIFE_DEATH_BOTTOM_LIMIT)
      end
    end

    kill.each(&:die!)
    liven_up.each(&:live!)

    @map
  end

  def next_to(i, j)
    res = []

    res << @map[i-1][j]
    if @map[i-1].length > j + 1
      res << @map[i-1][j+1]
    else
      res << @map[i-1][0]
    end
    res << @map[i-1][j-1]

    if @map.length > i + 1
      row = i + 1
    else
      row = 0
    end
    if @map[row].length > j + 1
      res << @map[row][j+1]
    else
      res << @map[row][0]
    end
    res << @map[row][j]
    res << @map[row][j-1]

    if @map[i].length > j + 1
      res << @map[i][j+1]
    else
      res << @map[i][0]
    end

    res << @map[i][j-1]
  end
end
