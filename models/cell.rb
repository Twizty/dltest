class Cell
  attr_accessor :state

  class << self
    def alive
      new(true)
    end

    def dead
      new(false)
    end
  end

  def initialize(state)
    @state = state
  end

  def alive?
    @state
  end

  def dead?
    !alive?
  end
end
