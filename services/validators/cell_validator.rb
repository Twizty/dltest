module Validators
  class CellValidator
    VALID_VALUES = ['1', 'true', '0', 'false', 1, 0, true, false]

    def initialize(value)
      @value = value
    end

    def valid?
      VALID_VALUES.include?(@value)
    end
  end
end
