class Cell
  attr_accessor :state

  def initialize(state=false)
    @state = state
  end

  def alive?
    @state
  end

  def live!
    @state = true
  end

  def die!
    @state = false
  end

  def dead?
    !alive?
  end
end
