require './forms/cell_form.rb'

class InputReaderService
  attr_reader :input_path

  InvalidInput = Class.new(StandardError)

  LINE_SEPARATOR = ' '.freeze

  def initialize(input_path)
    @input_path = input_path
  end

  def perform
    @map = []

    File.readlines(input_path).each do |line|
      @map << line.split(LINE_SEPARATOR).map do |value|
        form = CellForm.new(value)
        raise InvalidInput, "unexpected value: #{value}" unless form.valid?
        form.cell
      end
    end

    @map
  end
end
