class Player
  DEFAULT_HITPOINTS = 100

  def initialize(name)
    @name = name
    @hitpoints = DEFAULT_HITPOINTS
  end

  attr_reader :name, :hitpoints, :last_hit

  def reduce_hitpoints(amount)
    @hitpoints -= amount
    @last_hit = amount
  end
end