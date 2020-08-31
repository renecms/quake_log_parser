# frozen_string_literal: true

require_relative 'kill_info'
require_relative 'player'
require 'json'

class Game
  attr_accessor :players

  def initialize
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

  def game_report
    {
        'total_kill' => @players.values.reduce(0) { |sum, x| sum + x.kill_count },
        'players' => @players.keys,
        'kills' => player_info
    }
  end

  def player_info
    hash = {}
    @players.map { |k, v| hash[k] = v.kill_count }
    hash
  end
end
