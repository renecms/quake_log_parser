require_relative 'kill_info'
require_relative 'player'

class Game
  def initialize(game_start_time)
    @game_start_time = game_start_time
    @players = {}
  end

  def add_player(player_name, player_id)
    @players[player_name] = Player.new(player_name, player_id)
  end

  def update_kill_count(kill_info)
    if kill_info.killer == '<world>'
      add_player(kill_info.dead, kill_info.dead_id) unless @players.key?(kill_info.dead)
      @players[kill_info.dead].remove_kill
    else
      add_player(kill_info.killer, kill_info.killer_id) unless @players.key?(kill_info.killer)
      add_player(kill_info.dead, kill_info.dead_id) unless @players.key?(kill_info.dead)
      @players[kill_info.killer].add_kill
    end

  end

  attr_accessor :game_start_time, :game_end_time, :players
end