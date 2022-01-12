class Player
  DEFAULT_HITPOINTS = 100


  def initialize(name)
    @name = name
    @hitpoints = DEFAULT_HITPOINTS
  end

  attr_reader :name, :hitpoints

  def reduce_hitpoints(amount)
    @hitpoints -= amount
  end
end