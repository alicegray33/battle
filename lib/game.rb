class Game
  ATTACK_DAMAGE = 5

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @attacker = @player_1
    @defender = @player_2
    @last_action = nil
    @winner = false
    @loser = false
  end

  attr_reader :player_1, :player_2, :attacker, :defender, :last_action, :winner, :loser

  def attack(player)
    player.reduce_hitpoints(ATTACK_DAMAGE)
    @last_action = :attack
    change_turn
    if @player_1.hitpoints <= 0
      @winner = @player_2
      @loser = @player_1
    elsif @player_2.hitpoints <= 0
      @winner = @player_1
      @loser = @player_2
    end
  end

  def change_turn
    if @attacker == @player_1
      @attacker = @player_2
      @defender = @player_1
    else
      @attacker = @player_1
      @defender = @player_2
    end
  end

end