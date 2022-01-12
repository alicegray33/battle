class Game
  ATTACK_DAMAGE = 5
  def attack(player)
    player.reduce_hitpoints(ATTACK_DAMAGE)
  end
end