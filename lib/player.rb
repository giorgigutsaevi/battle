class Player
  DEFAULT_HIT_POINTS = 60

  def initialize(name, hit_points = DEFAULT_HIT_POINTS )
    @name = name
    @health = hit_points 
  end

  def name
    @name.dup
  end

  def health
    @health.dup
  end

  def attack(player)
    player.reduce_health
  end

  def reduce_health
    @health -= 10
  end
end