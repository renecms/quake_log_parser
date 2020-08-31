# frozen_string_literal: true

require_relative 'kill_info'
require 'json'

class Game
  attr_accessor :players, :deaths_by_type

  def initialize
    @players = {}
    @deaths_by_type = {}
  end

  def update_death(death_type)
    @deaths_by_type[death_type] = 0 unless @deaths_by_type.key?(death_type)
    @deaths_by_type[death_type] += 1
  end

  def update_kill_count(kill_info)
    if kill_info.killer == '<world>'
      @players[kill_info.dead] = 0 unless @players.key?(kill_info.dead)
      @players[kill_info.dead] -= 1
    else
      @players[kill_info.killer] = 0 unless @players.key?(kill_info.killer)
      @players[kill_info.dead] = 0 unless @players.key?(kill_info.dead)
      @players[kill_info.killer] += 1
    end
    update_death(kill_info.cod)
  end

  def game_report
    {
        'total_kill' => @players.values.reduce(0) { |sum, x| sum + x },
        'players' => @players.keys,
        'kills' => @players
    }
  end
end
