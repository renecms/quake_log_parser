# frozen_string_literal: true

require_relative 'kill_info'
require 'json'

class Game
  attr_accessor :players

  def initialize
    @players = {}
  end

  def add_player(player_name)
    @players[player_name] = 0
  end

  def update_kill_count(kill_info)
    if kill_info.killer == '<world>'
      add_player(kill_info.dead) unless @players.key?(kill_info.dead)
      @players[kill_info.dead] -= 1
    else
      add_player(kill_info.killer) unless @players.key?(kill_info.killer)
      add_player(kill_info.dead) unless @players.key?(kill_info.dead)
      @players[kill_info.killer] += 1
    end
  end

  def game_report
    {
        'total_kill' => @players.values.reduce(0) { |sum, x| sum + x },
        'players' => @players.keys,
        'kills' => @players
    }
  end

  def player_info
    hash = {}
    @players.map { |k, v| hash[k] = v.kill_count }
    hash
  end
end
