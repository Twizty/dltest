class Cell
  attr_accessor :state

  def initialize(state=false)
    if state == 'true' || state == 'false'
      @state = eval(state)
    elsif state == '0' || state == '1'
      @state = state.to_i == 0 ? false : true
    elsif state == true || state == false
      @state = state
    end
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
