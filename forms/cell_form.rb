require './services/validators/cell_validator.rb'
require './models/cell.rb'

class CellForm
  attr_reader :value

  ALIVE_VALUES = [1, true, '1', 'true']

  def initialize(value)
    @value = value
  end

  def valid?
    Validators::CellValidator.new(value).valid?
  end

  def cell
    if alive?
      Cell.alive
    else
      Cell.dead
    end
  end

  private

  def alive?
    ALIVE_VALUES.include?(value)
  end
end
