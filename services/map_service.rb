class MapService
  LIFE_BIRTH_COUNT = 3
  LIFE_DEATH_UPPER_LIMIT = 3
  LIFE_DEATH_BOTTOM_LIMIT = 2

  attr_reader :map

  def initialize(map)
    @map = map
  end

  def next_generation
    new_map = []

    @map.each_with_index do |row, i|
      r = []

      row.each_with_index do |cell, j|
        next_cells        = next_to(i, j)
        alive_cells       = next_cells.select(&:alive?)
        alive_cells_count = alive_cells.length

        if need_to_alive?(cell, alive_cells_count)
          r << Cell.alive
        elsif need_to_kill?(cell, alive_cells_count)
          r << Cell.dead
        else
          r << cell
        end
      end

      new_map << r
    end

    new_map
  end

  def need_to_alive?(cell, alive_cells_count)
    cell.dead? && alive_cells_count == LIFE_BIRTH_COUNT
  end

  def need_to_kill?(cell, alive_cells_count)
    cell.alive? && (alive_cells_count > LIFE_DEATH_UPPER_LIMIT || alive_cells_count < LIFE_DEATH_BOTTOM_LIMIT)
  end

  def next_to(i, j)
    res = []

    # правая нижняя ячейка
    if @map[i-1].length > j + 1
      res << @map[i-1][j+1]
    else
      res << @map[i-1][0]
    end

    if @map.length > i + 1
      row = i + 1
    else
      row = 0
    end

    # нижняя ячейка
    if @map[row].length > j + 1
      res << @map[row][j+1]
    else
      res << @map[row][0]
    end

    # правая ячейка
    if @map[i].length > j + 1
      res << @map[i][j+1]
    else
      res << @map[i][0]
    end

    res << @map[i-1][j]
    res << @map[i-1][j-1]
    res << @map[row][j]
    res << @map[row][j-1]
    res << @map[i][j-1]
  end
end
