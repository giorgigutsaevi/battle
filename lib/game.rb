class Game
  attr_reader :players
  attr_accessor :active_player

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @active_player = @players.first
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.reduce_health
  end

  # def current_player(player)
  #   @active_player = player if @players.include?(player)
  # end

  def switch_player
    if @active_player == player_1
      @active_player = player_2
    elsif @active_player == player_2
      @active_player = player_1
    end
  end

end

